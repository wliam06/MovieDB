//
//  MockURLSessionDataTask.swift
//  MovieDBTests
//
//  Created by William on 01/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB
class MockURLSessionDataTask: URLSessionDataTaskProtocol {
  private(set) var resumeWasCalled = false
  func resume() {
    resumeWasCalled = true
  }
}
