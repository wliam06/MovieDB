//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by William on 19/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import MovieSDK

class MovieListViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  var viewModel: MovieListViewViewModel?

  private var movies: [Movie]!
  private var adapter: CollectionViewAdapter!

  private(set) var selectedIndex = 0
  private(set) var isLoading = true
  private(set) var page = 1

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.navigationBar.isHidden = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = .blackPearl

    adapter = CollectionViewAdapter(collectionView: collectionView,
                                    delegate: self, data: [])

    bind(to: viewModel)
    segmentLoad(index: segmentedControl.selectedSegmentIndex)
  }

  private func segmentLoad(index: Int) {
    viewModel?.requestMovieList(index: segmentedControl.selectedSegmentIndex)
  }

  private func bind(to viewModel: MovieListViewModel?) {
    viewModel?.route.observe(on: self) { [weak self] in self?.handle($0)}
    viewModel?.items.observe(on: self) { [weak self] in
      self?.collectionViewLoadWithAnimation(movies: $0)
    }
    viewModel?.isLoading.observe(on: self, observerBlock: { [weak self] _ in
      self?.viewIsLoading()
    })
  }

  private func collectionViewLoadWithAnimation(movies: [Movie]) {
    self.collectionView.performBatchUpdates({
      let range = Range(uncheckedBounds: (0, self.collectionView.numberOfSections))
      let indexSet = IndexSet(integersIn: range)
      self.collectionView.reloadSections(indexSet)

      self.adapter.update(with: movies)

      activityIndicator.stopAnimating()
    }, completion: nil)
  }

  private func viewIsLoading() {
    activityIndicator.isHidden = true

    switch viewModel?.isLoading.value {
    case .none:
      return
    case .currentPage:
      activityIndicator.isHidden = false
    case .nextPage:
      activityIndicator.isHidden = false
    default:
      activityIndicator.isHidden = true
      return
    }
  }

  @IBAction func segmentedControlTapped(_ sender: Any) {
    viewModel?.requestMovieList(index: segmentedControl.selectedSegmentIndex)
  }

  // MARK: - Wireframe
  private func handle(_ route: MovieListWireframeRoute) {
    switch route {
    case .initial:
      debugPrint("INITIAL")
      break
    case .navigateToDetail(let withID):
      let detailVC = MovieDetailWireframe(movieId: withID).controller
      navigationController?.pushViewController(detailVC, animated: true)
      return
    }
  }
}

extension MovieListViewController: CollectionAdapterDelegate {
  func movieListEndOfStream() {
    viewModel?.didLoadNextPage()
  }

  func movieDidTapped(withId movieId: Int) {
    viewModel?.movieDidTapped(withId: movieId)
  }
}
