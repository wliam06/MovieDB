//
//  MockServiceEndpoint.swift
//  MovieDBTests
//
//  Created by William on 29/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB
class MockServiceEndpoint: Requestable {
  var path: String
  var method: HTTPMethodType
  var headerParams: [String : String] = [:]
  var queryParamEncodable: Encodable? = nil
  var queryParams: [String : Any] = [:]
  var bodyParamEncodable: Encodable? = nil
  var bodyParams: [String : Any] = [:]
  var bodyEncoding: BodyEncoding = .stringEncodingAscii

  init(path: String, method: HTTPMethodType) {
    self.path = path
    self.method = method
  }
}
