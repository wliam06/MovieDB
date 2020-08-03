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
    case true:
      return .main
    default:
      return .auth
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
//    switch instructor {
//    case .auth:
//      showLaunchScreen()
//    case .main:
//
//    }
    showLaunchScreen()
  }

  private func showLaunchScreen() {
    let launchScreenDIContainer = DIContainer.makeLaunchScreenDIContainer()
    let flow = launchScreenDIContainer.makeLaunchScreenFlowCoordinator(router: router)
    flow.finishFlow = { [weak self, weak flow] in
      isAuthorized = false
      self?.showAuthentication()
      self?.removeDependency(flow)
    }
    addDependency(flow)
    flow.start()
  }
  
  private func showAuthentication() {
    
  }

//  private func router(_ navController: UINavigationController) -> Router {
//    return AppRouter(rootController: )
//  }
}
