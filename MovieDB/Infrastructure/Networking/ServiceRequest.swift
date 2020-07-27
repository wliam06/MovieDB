//
//  ServiceRequest.swift
//  MovieDB
//
//  Created by William on 27/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
  case error(statusCode: Int, data: Data?)
  case notConnected
  case cancelled
  case generic(Error)
  case urlGeneration
}

public protocol NetworkService {
  typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void

  func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> URLSessionTask?
}

public final class ServiceRequest {
  private let config: ServiceConfigurable
  private let session: SessionRequestable

  init(config: ServiceConfigurable,
       session: SessionRequestable = ServiceSession()) {
    self.config = config
    self.session = session
  }

  private func request(request: URLRequest, completion: @escaping CompletionHandler) -> URLSessionTask {
    let dataTask = session.request(request) { (data, response, error) in
      if let err = error {
        var networkError: NetworkError
        if let response = response as? HTTPURLResponse {
          networkError = .error(statusCode: response.statusCode, data: data)
        } else {
          networkError = self.resolve(error: err)
        }
        
        completion(.failure(networkError))
      } else {
        completion(.success(data))
      }
    }
    
    return dataTask
  }

  private func resolve(error: Error) -> NetworkError {
    let code = URLError.Code(rawValue: (error as NSError).code)

    switch code {
    case .notConnectedToInternet: return .notConnected
    case .cancelled: return .cancelled
    default: return .generic(error)
    }
    
  }
}

extension ServiceRequest: NetworkService {
  public func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> URLSessionTask? {
    do {
      let urlRequest = try endpoint.urlRequest(with: config)
      return request(request: urlRequest, completion: completion)
    } catch {
      completion(.failure(.urlGeneration))
      return nil
    }
  }
}
