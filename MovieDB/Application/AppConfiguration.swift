//
//  AppConfiguration.swift
//  MovieDB
//
//  Created by William on 19/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class AppConfiguration {
    lazy var apiKey: String = {
        let envAPI = ProcessInfo.processInfo.environment
        guard let apiKey = envAPI["API_KEY"] else { return "" }

        return apiKey
    }()
}
