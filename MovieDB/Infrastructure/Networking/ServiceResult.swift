//
//  ServiceResult.swift
//  MovieDB
//
//  Created by William on 27/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public enum ServiceDataError: Error {
  case noResponse
  case parsing(Error)
  case invalidNetwork(NetworkError)
  case resolvedNetworkFailure(Error)
}

public protocol ServiceDataRequest {
  typealias CompletionHandler<T> = (Result<T, ServiceDataError>) -> Void

  @discardableResult
  func request<T: Decodable, E: ResponseRequestable>(endpoint: E,
                                                     completion: @escaping CompletionHandler<T>) -> URLSessionDataTaskProtocol? where E.Response == T

  @discardableResult
  func request<E: ResponseRequestable>(endpoint: E,
                                       completion: @escaping CompletionHandler<Void>) -> URLSessionDataTaskProtocol? where E.Response == Void
}

public final class ServiceDataResult {
  private let service: NetworkService
  private let errorResolver: DataErrorResolver

  public init(service: NetworkService,
              errorResolver: DataErrorResolver = ServiceDataErrorResolver()) {
    self.service = service
    self.errorResolver = errorResolver
  }
}

// MARK: - ServiceDataRequest
extension ServiceDataResult: ServiceDataRequest {
  private func resolve(error: NetworkError) -> ServiceDataError {
    let resolvedError = self.errorResolver.resolve(error: error)
    return resolvedError is NetworkError ? .invalidNetwork(error) : .resolvedNetworkFailure(resolvedError)
  }

  private func decode<T: Decodable>(data: Data?, decoder: ResponseDecoder) -> Result<T, ServiceDataError> {
    do {
      guard let data = data else { return .failure(.noResponse) }
      let result: T = try decoder.decode(data)
      return .success(result)
    } catch {
      return .failure(.parsing(error))
    }
  }

  public func request<T, E>(endpoint: E,
                            completion: @escaping CompletionHandler<T>) -> URLSessionDataTaskProtocol? where T : Decodable, T == E.Response, E : ResponseRequestable {
    return self.service.request(endpoint: endpoint) { (result) in
      switch result {
      case .success(let data):
        let result: Result<T, ServiceDataError> = self.decode(data: data, decoder: endpoint.responseDecoder)

        DispatchQueue.main.async { return completion(result) }
      case .failure(let error):
        let err = self.resolve(error: error)
        DispatchQueue.main.async { return completion(.failure(err)) }
      }
    }
  }

  public func request<E>(endpoint: E,
                         completion: @escaping CompletionHandler<Void>) -> URLSessionDataTaskProtocol? where E : ResponseRequestable, E.Response == Void {
    return self.service.request(endpoint: endpoint) { (result) -> Void in
      switch result {
      case .success:
        DispatchQueue.main.async { return completion(.success(())) }
      case .failure(let error):
        let err = self.resolve(error: error)
        DispatchQueue.main.async { return completion(.failure(err)) }
      }
    }
  }
}
