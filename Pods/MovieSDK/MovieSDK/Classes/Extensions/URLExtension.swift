//
//  URLExtension.swift
//  MovieSDK
//
//  Created by William on 15/12/19.
//

import Foundation

extension URL {
  func appending(_ path: String? = "", queryItems: [String: String], value: String) -> URL? {
    var urlComponents = URLComponents(string: value)
    if let urlPath = path {
      urlComponents?.path = "/3/\(urlPath)"
    }

    var items: [URLQueryItem] = urlComponents?.queryItems ?? []
    var queryItem: URLQueryItem!

    for item in queryItems {
      queryItem = URLQueryItem(name: item.key, value: item.value)
      items.append(queryItem)
    }

    urlComponents?.queryItems = items

    return urlComponents?.url
  }
}
