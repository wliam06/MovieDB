//
//  AppDIContainer.swift
//  MovieDB
//
//  Created by William on 19/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

final class AppDIContainer {
    lazy var appConfigurations = AppConfiguration()

    // MARK: - MovieSDK
    func instanceMovieSDK() {
        ServiceManager.start(apiKey: appConfigurations.apiKey)
    }

    func firstRoot() -> MovieSceneDIContainer {
        // Instance movie container
        return MovieSceneDIContainer()
    }
}
