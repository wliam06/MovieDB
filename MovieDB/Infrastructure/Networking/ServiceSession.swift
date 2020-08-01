//
//  ServiceSession.swift
//  MovieDB
//
//  Created by William on 27/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public protocol SessionRequestable {
  typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

  func request(_ request: URLRequest,
               completion: @escaping CompletionHandler) -> URLSessionDataTaskProtocol
}

public protocol URLSessionDataTaskProtocol {
  func resume()
}

extension URLSessionTask: URLSessionDataTaskProtocol {}

public class ServiceSession: SessionRequestable {
  public init() {}
  public func request(_ request: URLRequest,
                      completion: @escaping CompletionHandler) -> URLSessionDataTaskProtocol {
    let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
    task.resume()
    return task
  }
}
