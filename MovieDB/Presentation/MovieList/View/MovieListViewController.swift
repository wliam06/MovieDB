//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by William on 19/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  var viewModel: MovieListViewViewModel?

  private var movies: [Movie]!
  private var adapter: CollectionViewAdapter!

  private(set) var selectedIndex = 0
  private(set) var isLoading = true

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

    segmentLoad()
  }

  private func bind(to viewModel: MovieListViewModel?) {
    viewModel?.route.observe(on: self) { [weak self] in self?.handle($0)}
    viewModel?.items.observe(on: self) { [weak self] in
      self?.movies = $0
      self?.adapter.update(with: $0)
    }
    viewModel?.isLoading.observe(on: self) { [weak self] (status) in
      self?.isLoading = status
      self?.activityIndicator.isHidden = status
      self?.activityIndicator.stopAnimating()
    }
  }

  private func segmentLoad() {
    if segmentedControl.selectedSegmentIndex == 0 {
      viewModel?.requestMovieList(movieType: .nowPlaying, page: "1", isLoading: true)
    }
  }

  private func handle(_ route: MovieListViewModelRoute) {
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

  @IBAction func segmentedControlTapped(_ sender: Any) {
    selectedIndex = segmentedControl.selectedSegmentIndex

    switch segmentedControl.selectedSegmentIndex {
    case 0:
      clearData()

      viewModel?.requestMovieList(movieType: .nowPlaying, page: "1", isLoading: true)
    case 1:
      clearData()
      viewModel?.requestMovieList(movieType: .popular, page: "1", isLoading: true)
    case 2:
      clearData()

      viewModel?.requestMovieList(movieType: .topRated, page: "1", isLoading: true)
    default:
      return
    }
  }

  private func clearData() {
    guard movies.count > 0 else { return }

    self.movies = [Movie]()
    self.activityIndicator.isHidden = false
    self.activityIndicator.startAnimating()
    self.adapter.update(with: movies)

    collectionView.reloadData()
  }
}

extension MovieListViewController: CollectionAdapterDelegate {
  func movieDidTapped(withId movieId: Int) {
    viewModel?.movieDidTapped(withId: movieId)
  }
}
