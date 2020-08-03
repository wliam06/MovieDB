//
//  AppFlowCoordinator.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

final class AppFlowCoordinator: BaseCoordinator {
  private let router: Router
  private let DIContainer: AppDIContainer

  init(router: Router, DIContainer: AppDIContainer) {
    self.router = router
    self.DIContainer = DIContainer
  }

  override func start() {
    // Implement Deeplink here

    let launchScreenDIContainer = DIContainer.makeLaunchScreenDIContainer()
    let flow = launchScreenDIContainer.makeLaunchScreenFlowCoordinator(router: router)
    flow.start()
  }
}
