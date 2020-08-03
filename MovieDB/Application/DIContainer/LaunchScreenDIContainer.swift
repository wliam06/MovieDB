//
//  LaunchScreenDIContainer.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

struct LaunchScreenDependencies {
  let apiDataService: ServiceDataResult
}

final class LaunchScreenDIContainer {
  private let dependencies: LaunchScreenDependencies

  init(dependencies: LaunchScreenDependencies) {
    self.dependencies = dependencies
  }

  // MARK: - Coordinator
  func makeLaunchScreenFlowCoordinator(router: Router) -> Coordinator {
    return LauncScreenCoordinator(router: router, dependencies: self)
  }
}

extension LaunchScreenDIContainer: LaunchScreenCoordinatorDependencies {
  // MARK: - ViewModel
  func makeLaunchScreenViewModel() -> LaunchScreenViewModel {
    return DefaultLaunchScreenViewModel()
  }
  
  // MARK: - View
  func makeLaunchScreenViewController() -> LaunchScreenViewController {
    return LaunchScreenViewController.create(withViewModel: makeLaunchScreenViewModel())
  }
}
