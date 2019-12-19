//
//  ServiceManager.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

public typealias onComplete = (Any?) -> Void

public class ServiceManager {
  private let session: ServiceSession

  public class var api: ServiceManager {
    if let sharedInstance = self.sharedInstance {
      return sharedInstance
    }

    fatalError("ServiceManager is not initialized")
  }

  private static var sharedInstance: ServiceManager?
  public static var header = ["Content-Type": "application/json"]
  public var baseURL: URL!

  /// Initialize ServiceSession
  init(session: ServiceSession = URLSession.shared, baseURL: URL) {
    self.session = session
    self.baseURL = baseURL
  }

  /// Start MovieSDK
  /// - Parameter apiKey: insert your movie api key, [Get The Movie DB  API Key here](https://www.themoviedb.org)
  public class func start(apiKey: String) {
    guard let url = URL(string: Constants.baseURL),
      let finalURL = url.appending(["api_key": apiKey], value: Constants.baseURL) else { return }

    if sharedInstance == nil {
      sharedInstance = ServiceManager(session: URLSession.shared, baseURL: finalURL)
    }
  }

  /// Load network requesting
  /// - Parameter urlPath: The Movie DB url path
  /// - Parameter method: The Movie DB network request method
  /// - Parameter body: The Movie DB url body or params
  /// - Parameter completion: The Movie DB respond data and error
  func load(urlPath: String, queryItems: [String: String]? = [:], method: HTTPMethod, body: [String: Any]? = nil,
            completion: @escaping(Any?, ServiceError?) -> Void) {
    guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else { return }
    components.path = "/3/\(urlPath)"

    guard let url = components.url else { return }

    // Append query items
    url.appending(queryItems ?? [:], value: baseURL.absoluteString)

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    urlRequest.allHTTPHeaderFields = ServiceManager.header

    if let body = body {
      urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    }

    #if DEBUG
    debugPrint("###########################-------- REQUEST URL --------###########################")
    debugPrint(urlRequest.url!)
    debugPrint("#############--------##############")
    #endif

    session.load(url: urlRequest) { (data, response, error) in
      var serviceErrorType = ServiceErrorType.network

      // Check data is exist or nil
      guard let data = data, error == nil else {
        completion(nil, ServiceError(type: serviceErrorType))
        return
      }

      do {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        if let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode != 200, httpResponse.statusCode != 201 {
          if let message = ((json as? [String: Any])?["errors"] as? [String])?.first {
            serviceErrorType = .err(message: message)
          } else {
            serviceErrorType = .err(message: Constants.unexpectedError)
          }

          completion(json, ServiceError(type: serviceErrorType))
          return
        }

        completion(json, nil)
      } catch {
        serviceErrorType = .invalid
        completion(nil, ServiceError(type: serviceErrorType))
      }
    }
  }
}
