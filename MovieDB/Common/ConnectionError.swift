//
//  ConnectionError.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

public protocol ConnectionError: Error {
    var internetConnectionError: Bool { get }
}

public extension Error {
    var isInternetConnected: Bool {
        guard let error = self as? ConnectionError, error.internetConnectionError else { return false }

        return true
    }
}
