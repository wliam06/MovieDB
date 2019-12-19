//
//  MovieSession.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

open class MovieListSession {
  public init() {}

  deinit {
    #if DEBUG
    debugPrint(String(describing: self) + " deinit")
    #endif
  }

  /// Get the most newly created movie
  /// - Parameter onComplete: Movie Response
  /// - Parameter onFailure: Invalid Movie Response
  open func latestMovie(onComplete: onComplete?, onFailure: onFailure?) {
    ServiceManager.api.load(urlPath: MovieListPath.latest.path, method: .GET) { (data, error) in
      if let error = error {
        onFailure?(error)
        return
      }

      onComplete?(data)
    }
  }

  /// Get List of Movies in theatres (Latest, Now Playing, Popular, Top Rated, Upcoming)
  /// - Parameter movieList: Choose list of movie
  /// - Parameter onComplete: Movie Response
  /// - Parameter onFailure: Invalid Movie Response
  open func listOfMove(movie: MovieListPath, page: String = "1", language: String = "en-US",
                       region: String = "", onComplete: onComplete?, onFailure: onFailure?) {
    let param: [String: String] = ["language": language, "page": page, "region": region]

    ServiceManager.api.load(urlPath: movie.path, queryItems: param, method: .GET, body: nil) { (data, error) in
      if let error = error {
        onFailure?(error)
        return
      }

      onComplete?(data)
    }
  }
}
