//
//  Decodable.swift
//  MovieSDK
//
//  Created by William on 30/12/19.
//

import Foundation

protocol ResponseDecoder {
  func decode<T: Decodable>(_ data: Data) throws -> T
}

protocol Decodable: class {}

extension Decodable {
  func decode<T: Decodable>(data: Data?, decoder: ResponseDecoder) -> Result<T, ServiceError> {
    let errorType = ServiceErrorType.err(message: "Invalid decode response")
    do {
      guard let data = data else {return .failure(ServiceError(type: errorType))}
      let result: T = try decoder.decode(data)
      return .success(result)
    } catch {
      return .failure(ServiceError(type: errorType))
    }
  }
}
