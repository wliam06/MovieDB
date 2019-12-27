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
  
  func initMovieListViewController() -> UIViewController {
    return MovieListViewController.create(withViewModel: MovieListViewViewModel(movieListUseCase: loadMovieListUseCase()),
                                          movieListViewControllerFactory: self)
  }
}

// MARK: - Movie List Factory
extension MovieSceneDIContainer: MovieListViewControllerFactory {
  func loadMovieDetailUseCase() -> MovieDetailUseCaseInterface {
    return MovieDetailUseCase(repository: loadMovieDetailRepository())
  }

  func loadMovieDetailRepository() -> MovieDetailRepository {
    return MovieDetailRepository()
  }

  func createMovieDetailViewController(withId id: Int) -> UIViewController {
    return MovieDetailViewController.create(with: MovieDetailViewViewModel(movieId: id,
                                                                           useCase: loadMovieDetailUseCase()))
  }
}
