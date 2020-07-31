//
//  MockServiceConfigurable.swift
//  MovieDBTests
//
//  Created by William on 28/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB
class MockServiceConfigurable: ServiceConfigurable {
  var baseURL: URL = URL(string: "https://test.com")!
  var headers: [String : String] = [:]
  var queryParams: [String : String] = [:]
}
