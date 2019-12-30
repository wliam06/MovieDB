//
//  MovieListWireframe.swift
//  MovieDB
//
//  Created by William on 27/12/19.
//  Copyright © 2019 William. All rights reserved.
//
import UIKit

enum MovieListWireframeRoute {
  case initial
  case navigateToDetail
}

class MovieListWireframe: Router {
  var controller: UIViewController {
    let view = MovieListViewController()
    let repository = MovieListRepository()
    let usecase = MovieListUseCase(moviesRepository: repository)
    let viewModel = MovieListViewViewModel(movieListUseCase: usecase)

    view.viewModel = viewModel

    return view
  }
}
