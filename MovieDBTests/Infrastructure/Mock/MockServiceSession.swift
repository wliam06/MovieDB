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
  let response: HTTPURLResponse?
  let data: Data?
  let error: Error?

  init(response: HTTPURLResponse?, data: Data?, error: Error?) {
    self.response = response
    self.data = data
    self.error = error
  }
  
  func request(_ request: URLRequest,
               completion: @escaping CompletionHandler) -> URLSessionTask {
      completion(data, response, error)
      return URLSessionTask()
  }
}
