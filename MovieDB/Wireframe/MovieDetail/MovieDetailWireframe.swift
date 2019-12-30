//
//  MovieDetailWireframe.swift
//  MovieDB
//
//  Created by William on 27/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MovieDetailWireframe: Router {
  var controller: UIViewController {
    let view = MovieDetailViewController()
    let repository = MovieDetailRepository()
    let usecase = MovieDetailUseCase(repository: repository)
    let viewModel = MovieDetailViewViewModel(movieId: movieId, useCase: usecase, wireframe: self)

    view.viewModel = viewModel

    return view
  }

  private var movieId: Int?

  init(movieId: Int) {
    self.movieId = movieId
  }
}
