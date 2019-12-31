//
//  MovieSceneDIContainer.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class MovieSceneDIContainer {
  init() {
  }

  func loadMovieListUseCase() -> MovieListUseCaseInterface {
    return MovieListUseCase(moviesRepository: loadMovieListRepository())
  }

  func loadMovieListRepository() -> MovieListRepository {
    return MovieListRepository()
  }
}

// MARK: - Movie List Factory
extension MovieSceneDIContainer {
  func loadMovieDetailUseCase() -> MovieDetailUseCaseInterface {
    return MovieDetailUseCase(repository: loadMovieDetailRepository())
  }

  func loadMovieDetailRepository() -> MovieDetailRepository {
    return MovieDetailRepository()
  }
}
