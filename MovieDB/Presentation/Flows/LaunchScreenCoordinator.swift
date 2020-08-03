//
//  LaunchScreenCoordinator.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

protocol LaunchScreenCoordinatorDependencies: class {
  func makeLaunchScreenViewController() -> LaunchScreenViewController
}

final class LauncScreenCoordinator: BaseCoordinator {
  private let router: Router
  private let dependencies: LaunchScreenCoordinatorDependencies

  init(router: Router,
       dependencies: LaunchScreenCoordinatorDependencies) {
    self.router = router
    self.dependencies = dependencies
  }

  override func start() {
    let view = dependencies.makeLaunchScreenViewController()
    router.setRootModule(view)
  }
}
