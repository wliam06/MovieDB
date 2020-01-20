//
//  MockMovieListRepositoryInterface.swift
//  MovieDBTests
//
//  Created by William on 18/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest
import MovieSDK

@testable import MovieDB
class MockMovieListRepositoryInterface: MovieListRepositoryInterface {
  var invokedShowMovieList = false
  var invokedShowMovieListCount = 0
  var invokedShowMovieListParameters: (movie: MoviePath, page: String)?
  var invokedShowMovieListParametersList = [(movie: MoviePath, page: String)]()
  var stubbedShowMovieListCompletionResult: (Result<MoviePage, Error>, Void)?

  func showMovieList(movie: MoviePath, page: String, completion: @escaping(Result<MoviePage, Error>) -> Void) {
    invokedShowMovieList = true
    invokedShowMovieListCount += 1
    invokedShowMovieListParameters = (movie, page)
    invokedShowMovieListParametersList.append((movie, page))
    if let result = stubbedShowMovieListCompletionResult {
      completion(result.0)
    }
  }
}
