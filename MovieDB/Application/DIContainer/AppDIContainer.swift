//
//  AppDIContainer.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

final class AppDIContainer {
  lazy var configuration = AppConfiguration()

  lazy var apiDataService: ServiceDataResult = {
    let config = ServiceNetworkConfig(baseURL: URL(string: configuration.baseURL)!,
                                      queryParams: ["api_key": configuration.apiKey,
                                                    "language": NSLocale.preferredLanguages.first ?? "en"])
    let network = ServiceRequest(config: config)
    return ServiceDataResult(service: network)
  }()

  func makeLaunchScreenDIContainer() -> LaunchScreenDIContainer {
    let dependencies = LaunchScreenDependencies(apiDataService: apiDataService)
    return LaunchScreenDIContainer(dependencies: dependencies)
  }
}
