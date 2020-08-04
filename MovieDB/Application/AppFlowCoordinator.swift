//
//  AppFlowCoordinator.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

fileprivate var isAuthorized = false

fileprivate enum LaunchInstructor {
  case auth, main

  static func configure(isAuth: Bool = isAuthorized) -> LaunchInstructor {
    switch isAuth {
    case false:
      return .auth
    case true:
      return .main
    }
  }
}

final class AppFlowCoordinator: BaseCoordinator {
  private let router: Router
  private let DIContainer: AppDIContainer

  private var instructor: LaunchInstructor {
    return LaunchInstructor.configure()
  }

  init(router: Router, DIContainer: AppDIContainer) {
    self.router = router
    self.DIContainer = DIContainer
  }

  override func start() {
    // Implement Deeplink here
    switch instructor {
    case .auth:
      showLaunchScreen()
    case .main:
      showMovieList()
    }
  }

  private func showLaunchScreen() {
    let launchScreenDIContainer = DIContainer.makeLaunchScreenDIContainer()
    let coordinator = launchScreenDIContainer.makeLaunchScreenFlowCoordinator(router: router)
    coordinator.finishFlow = { [weak self, weak coordinator] in
      isAuthorized = true
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }

  private func showMovieList() {
    
  }
}
