//
//  MovieSceneDIContainer.swift
//  MovieDB
//
//  Created by William on 04/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

final class MovieSceneDIContainer {
  
  // MARK: - Coordinator
  func makeMovieSceneFlowCoordinator(router: Router) -> Coordinator {
    return MovieSceneCoordinator(router: router, dependencies: self)
  }
}

extension MovieSceneDIContainer: MovieSceneCoordinatorDependencies {
  func makeMovieListViewModel() -> MovieListViewModel {
    return DefaultMovieListViewModel()
  }

  func makeMovieListViewController() -> MovieListViewController {
    return MovieListViewController.create(withViewModel: makeMovieListViewModel())
  }
  // MARK: - Repository
  // MARK: - UseCase

  // MARK: - ViewModel
  

  // MARK: - View
  
}
