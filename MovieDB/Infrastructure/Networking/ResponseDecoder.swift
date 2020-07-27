//
//  ResponseDecoder.swift
//  MovieDB
//
//  Created by William on 27/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

// MARK: - Response Decoder
public protocol ResponseDecoder {
  func decode<T: Decodable>(_ data: Data) throws -> T
}

public class JSONResponseDecoder: ResponseDecoder {
  private let decoder = JSONDecoder()

  public init() {}

  public func decode<T>(_ data: Data) throws -> T where T : Decodable {
    return try decoder.decode(T.self, from: data)
  }
}

public protocol DataErrorResolver {
  func resolve(error: NetworkError) -> Error
}

public class ServiceDataErrorResolver: DataErrorResolver {
  public init() {}

  public func resolve(error: NetworkError) -> Error {
    return error
  }
}
