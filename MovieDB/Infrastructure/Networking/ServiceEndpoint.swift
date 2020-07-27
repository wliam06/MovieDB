//
//  ServiceEndpoint.swift
//  MovieDB
//
//  Created by William on 27/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public enum HTTPMethodType: String {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
}

public enum BodyEncoding {
  case jsonSerializationData
  case stringEncodingAscii
}

public enum RequestableError: Error {
  case components
}

public protocol Requestable {
  var path: String { get }
  var method: HTTPMethodType { get }
  var headerParams: [String : String] { get }
  var queryParamEncodable: Encodable? { get }
  var queryParams: [String : Any] { get }
  var bodyParamEncodable: Encodable? { get }
  var bodyParams: [String : Any] { get }
  var bodyEncoding: BodyEncoding { get }

  func urlRequest(with config: ServiceConfigurable) throws -> URLRequest
}

public protocol ResponseRequestable: Requestable {
  associatedtype Response

  var responseDecoder: ResponseDecoder { get }
}

public class Endpoint<R>: ResponseRequestable {
  public typealias Response = R

  public var path: String
  public var method: HTTPMethodType
  public var headerParams: [String : String]
  public var queryParamEncodable: Encodable? = nil
  public var queryParams: [String : Any]
  public var bodyParamEncodable: Encodable? = nil
  public var bodyParams: [String : Any]
  public var bodyEncoding: BodyEncoding

  public var responseDecoder: ResponseDecoder

  init(path: String,
       method: HTTPMethodType,
       headerParams: [String : String] = [:],
       queryParamEncodable: Encodable? = nil,
       queryParams: [String : Any] = [:],
       bodyParamEncodable: Encodable? = nil,
       bodyParams: [String : Any] = [:],
       bodyEncoding: BodyEncoding = .jsonSerializationData,
       responseDecoder: ResponseDecoder = JSONResponseDecoder()) {
    self.path = path
    self.method = method
    self.headerParams = headerParams
    self.queryParamEncodable = queryParamEncodable
    self.queryParams = queryParams
    self.bodyParamEncodable = bodyParamEncodable
    self.bodyParams = bodyParams
    self.bodyEncoding = bodyEncoding
    self.responseDecoder = responseDecoder
  }
}


// MARK: - Requestable
extension Requestable {
  func url(with config: ServiceConfigurable) throws -> URL {
    let baseURL = config.baseURL.absoluteString.last != "/" ? config.baseURL.absoluteString + "/" : config.baseURL.absoluteString
    let endpoint = baseURL.appending(path)

    guard var urlComponents = URLComponents(string: endpoint) else { throw RequestableError.components }
    var urlQueryItems = [URLQueryItem]()

    let queryParams = try queryParamEncodable?.toDictionary() ?? self.queryParams

    queryParams.forEach {
      urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
    }

    config.queryParams.forEach {
      urlQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
    }

    urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil

    guard let url = urlComponents.url else { throw RequestableError.components }
    return url
  }

  public func encodedBody(params: [String: Any], encoding: BodyEncoding) -> Data? {
    switch encoding {
    case .jsonSerializationData:
      return try? JSONSerialization.data(withJSONObject: params)
    case .stringEncodingAscii:
      return params.queryString.data(using: .ascii, allowLossyConversion: true)
    }
  }

  public func urlRequest(with config: ServiceConfigurable) throws -> URLRequest {
    let url = try self.url(with: config)
    var urlRequest = URLRequest(url: url)
    var headers: [String : String] = config.headers

    headerParams.forEach { headers.updateValue($1, forKey: $0) }

    let bodyParams = try bodyParamEncodable?.toDictionary() ?? self.bodyParams
    if !bodyParams.isEmpty {
      urlRequest.httpBody = self.encodedBody(params: bodyParams, encoding: bodyEncoding)
    }

    urlRequest.httpMethod = method.rawValue
    urlRequest.allHTTPHeaderFields = headers
    return urlRequest
  }
}
