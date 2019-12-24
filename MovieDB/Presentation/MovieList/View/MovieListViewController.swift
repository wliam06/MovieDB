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
  private(set) var viewModel: MovieListViewModel!

  private var movies: [Movie]!
  private var adapter: CollectionViewAdapter!

  /// Instance ViewController
  final class func create(withViewModel viewModel: MovieListViewModel) -> MovieListViewController {
    let view = MovieListViewController()
    view.viewModel = viewModel

    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    adapter = CollectionViewAdapter(collectionView: collectionView, data: [])

    bind(to: viewModel)
    viewModel.requestMovieList()
  }

  private func bind(to viewModel: MovieListViewModel) {
    viewModel.items.observe(on: self) { [weak self] (movies) in
      self?.movies = movies
      self?.adapter.update(with: movies)
    }
  }
}
