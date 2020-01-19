//
//  MockMovieListUseCaseInterface.swift
//  MovieDBTests
//
//  Created by William on 18/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB
class MockMovieListUseCaseInterface: MovieListUseCaseInterface {
  var invokedLoadMovieListByType = false
  var invokedLoadMovieListByTypeCount = 0
  var invokedLoadMovieListByTypeParameters: (movie: MovieUseCaseResource, Void)?
  var invokedLoadMovieListByTypeParametersList = [(movie: MovieUseCaseResource, Void)]()
  var stubbedLoadMovieListByTypeCompletionResult: (Result<MoviePage, Error>, Void)?
  func loadMovieListByType(movie: MovieUseCaseResource,
  completion: @escaping(Result<MoviePage, Error>) -> Void) {
    invokedLoadMovieListByType = true
    invokedLoadMovieListByTypeCount += 1
    invokedLoadMovieListByTypeParameters = (movie, ())
    invokedLoadMovieListByTypeParametersList.append((movie, ()))
    if let result = stubbedLoadMovieListByTypeCompletionResult {
      completion(result.0)
    }
  }
}
