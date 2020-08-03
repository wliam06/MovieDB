//
//  MovieSceneCoordinator.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

protocol MovieSceneCoordinatorDependencies {
  func makeMovieListViewController() -> MovieListViewController
  // Movie Detail
}

final class MovieSceneCoordinator: BaseCoordinator {
  private let router: Router
  private let dependencies: MovieSceneCoordinatorDependencies

  init(router: Router, dependencies: MovieSceneCoordinatorDependencies) {
    self.router = router
    self.dependencies = dependencies
  }

  override func start() {
    let view = dependencies.makeMovieListViewController()
    router.setRootModule(view, hideBar: false)
  }
}
