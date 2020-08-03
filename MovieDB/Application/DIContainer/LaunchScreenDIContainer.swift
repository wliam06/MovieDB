//
//  LaunchScreenDIContainer.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

final class LaunchScreenDIContainer {
  // MARK: - Coordinator
  func makeLaunchScreenFlowCoordinator(router: Router) -> Coordinator & LaunchScreenOutput {
    return LauncScreenCoordinator(router: router, dependencies: self)
  }
}

extension LaunchScreenDIContainer: LaunchScreenCoordinatorDependencies {
  // MARK: - Repository
  // MARK: - UseCase

  // MARK: - ViewModel
  func makeLaunchScreenViewModel(closures: LaunchScreenClosures) -> LaunchScreenViewModel {
    return DefaultLaunchScreenViewModel(closures: closures)
  }

  func makeAuthenticationViewModel() -> AuthenticationViewModel {
    return DefaultAuthenticationViewModel()
  }

  // MARK: - View
  func makeLaunchScreenViewController(closures: LaunchScreenClosures) -> LaunchScreenViewController {
    return LaunchScreenViewController.create(withViewModel: makeLaunchScreenViewModel(closures: closures))
  }

  func makeAuthenticationViewController() -> AuthenticationViewController {
    return AuthenticationViewController.create(withViewModel: makeAuthenticationViewModel())
  }
}
