//
//  SearchPath.swift
//  MovieSDK
//
//  Created by William on 05/01/20.
//

import Foundation

public enum SearchPath {
  case search

  public var path: String {
    switch self {
    case .search:
      return "search/movie"
    }
  }
}
