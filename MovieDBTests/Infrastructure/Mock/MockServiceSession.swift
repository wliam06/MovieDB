//
//  MockServiceSession.swift
//  MovieDBTests
//
//  Created by William on 28/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB
class MockServiceSession: SessionRequestable {
  typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
  var dataTask = MockURLSessionDataTask()

  let response: URLResponse?
  let data: Data?
  let error: Error?

  init(response: HTTPURLResponse?, data: Data?, error: Error?) {
    self.response = response
    self.data = data
    self.error = error
  }

  func request(_ request: URLRequest,
               completion: @escaping CompletionHandler) -> URLSessionDataTaskProtocol {
    completion(data, response, error)
    return dataTask
  }
}
