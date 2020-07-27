//
//  ServiceConfig.swift
//  MovieDB
//
//  Created by William on 27/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public protocol ServiceConfigurable {
  var baseURL: URL { get }
  var headers: [String: String] { get }
  var queryParams: [String: String] { get }
}

public struct ServiceNetworkConfig: ServiceConfigurable {
  public var baseURL: URL
  public var headers: [String : String]
  public var queryParams: [String : String]

  init(baseURL: URL,
       headers: [String: String] = [:],
       queryParams: [String: String] = [:]) {
    self.baseURL = baseURL
    self.headers = headers
    self.queryParams = queryParams
  }
}
