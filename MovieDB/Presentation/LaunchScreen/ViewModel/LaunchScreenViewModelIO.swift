//
//  LaunchScreenViewModelIO.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

enum LaunchScreenViewModelLoading {
  case inScreen
  case nextScreen
}

protocol LaunchScreenViewModelInput: class {
  func fetchUserData()
}

protocol LaunchScreenViewModelOutput: class {
  var loading: Observable<LaunchScreenViewModelLoading?> { get }
}

protocol LaunchScreenViewModel: LaunchScreenViewModelInput, LaunchScreenViewModelOutput {}
