//
//  ServiceError.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

public typealias onFailure = (ServiceError?) -> Void

enum ServiceErrorType: Error, Equatable {
  case err(message: String)
  case network
  case invalid
  case unexpected
}

public struct ServiceError: Error, Equatable {
  let type: ServiceErrorType

  var message: String {
    switch type {
    case .err(let message):
      return message
    case .network:
      return Constants.networkMessage
    case .invalid:
      return Constants.invalidMessage
    case .unexpected:
      return Constants.unexpectedError
    }
  }
}
