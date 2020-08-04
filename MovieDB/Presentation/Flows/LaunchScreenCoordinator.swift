//
//  LaunchScreenCoordinator.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

protocol LaunchScreenCoordinatorDependencies: class {
  func makeLaunchScreenViewController(closures: LaunchScreenClosures) -> LaunchScreenViewController
  func makeAuthenticationViewController(closures: AuthenticationClosures) -> AuthenticationViewController
}

protocol LaunchScreenOutput: class {
  var finishFlow: (() -> Void)? { get set }
}

final class LauncScreenCoordinator: BaseCoordinator, LaunchScreenOutput {
  var finishFlow: (() -> Void)?

  private let router: Router
  private let dependencies: LaunchScreenCoordinatorDependencies

  init(router: Router,
       dependencies: LaunchScreenCoordinatorDependencies) {
    self.router = router
    self.dependencies = dependencies
  }

  override func start() {
    let closures = LaunchScreenClosures(showAuthenticationView: showAuthenticationView)
    let view = dependencies.makeLaunchScreenViewController(closures: closures)

    router.setRootModule(view, hideBar: true)
  }

  private func showAuthenticationView() {
    let closures = AuthenticationClosures(showMovieList: showMovieList)
    let view = dependencies.makeAuthenticationViewController(closures: closures)

    router.setRootModule(view, hideBar: false, animated: true)
  }

  private func showMovieList() {
    self.finishFlow?()
  }
}
