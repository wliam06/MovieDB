//
//  LaunchScreenViewModel.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

struct LaunchScreenClosures {
  var showAuthenticationView: (() -> Void)?
}

final class DefaultLaunchScreenViewModel: LaunchScreenViewModel {
  private let closures: LaunchScreenClosures?

  // output
  var loading: Observable<LaunchScreenViewModelLoading?> = Observable(.none)

  init(closures: LaunchScreenClosures? = nil) {
    self.closures = closures
  }
}

// MARK: - Input
extension DefaultLaunchScreenViewModel: LaunchScreenViewModelInput {
  func fetchUserData() {
    // Temporarily skip this
    self.closures?.showAuthenticationView?()
  }
}
