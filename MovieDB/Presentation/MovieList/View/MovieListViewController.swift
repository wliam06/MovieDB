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

  private var movies: [Movie]!
  private var adapter: CollectionViewAdapter!

  private(set) var viewModel: MovieListViewModel!
  private var factory: MovieListViewControllerFactory!

  /// Instance ViewController
  final class func create(withViewModel viewModel: MovieListViewModel,
                          movieListViewControllerFactory: MovieListViewControllerFactory) -> MovieListViewController {
    let view = MovieListViewController()
    view.viewModel = viewModel
    view.factory = movieListViewControllerFactory

    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    adapter = CollectionViewAdapter(collectionView: collectionView,
                                    delegate: self, data: [])

    bind(to: viewModel)
    viewModel.requestMovieList()
  }

  private func bind(to viewModel: MovieListViewModel) {
    viewModel.route.observe(on: self) { [weak self] in self?.handle($0)}
    viewModel.items.observe(on: self) { [weak self] (movies) in
      self?.movies = movies
      self?.adapter.update(with: movies)
    }
  }

  private func handle(_ route: MovieListViewModelRoute) {
    switch route {
    case .initial:
      debugPrint("INITIAL")
      break
    case .navigateToDetail(let withID):
      let detailVC = factory.createMovieDetailViewController(withId: withID)
      navigationController?.pushViewController(detailVC, animated: true)
    }
  }
}

extension MovieListViewController: CollectionAdapterDelegate {
  func movieDidTapped(withId movieId: Int) {
    viewModel.movieDidTapped(withId: movieId)
  }
}
