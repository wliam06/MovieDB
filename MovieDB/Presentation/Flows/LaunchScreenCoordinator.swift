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
  func makeAuthenticationViewController() -> AuthenticationViewController
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
    var closures = AuthenticationClosures()
    let view = dependencies.makeAuthenticationViewController()

    closures.showMovieList = { [weak self] in
      self?.finishFlow?()
    }

    router.setRootModule(view, hideBar: false, animated: true)
  }
}
