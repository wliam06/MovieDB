//
//  MockMovieService.swift
//  MovieDBTests
//
//  Created by William on 20/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest
import MovieSDK

class MockMovieService: Movies {
  var invokedListOfMovie = false
  var invokedListOfMovieCount = 0
  var invokedListOfMovieParameters: (movie: MoviePath, page: String, language: String, completion: CompletionHandler)?
  var invokedListOfMovieParametersList = [(movie: MoviePath, page: String, language: String, completion: CompletionHandler)]()
  override func listOfMovie(movie: MoviePath, page: String = "1", language: String = "en-US",
  completion: @escaping CompletionHandler) {
    invokedListOfMovie = true
    invokedListOfMovieCount += 1
    invokedListOfMovieParameters = (movie, page, language, completion)
    invokedListOfMovieParametersList.append((movie, page, language, completion))
  }
  var invokedDetailOfMovie = false
  var invokedDetailOfMovieCount = 0
  var invokedDetailOfMovieParameters: (id: Int, language: String, completion: CompletionHandler)?
  var invokedDetailOfMovieParametersList = [(id: Int, language: String, completion: CompletionHandler)]()
  override func detailOfMovie(withID id: Int, language: String = "en-US", completion: @escaping CompletionHandler) {
    invokedDetailOfMovie = true
    invokedDetailOfMovieCount += 1
    invokedDetailOfMovieParameters = (id, language, completion)
    invokedDetailOfMovieParametersList.append((id, language, completion))
  }
  var invokedVideoOfMovie = false
  var invokedVideoOfMovieCount = 0
  var invokedVideoOfMovieParameters: (id: Int, language: String, completion: CompletionHandler)?
  var invokedVideoOfMovieParametersList = [(id: Int, language: String, completion: CompletionHandler)]()
  override func videoOfMovie(withID id: Int, language: String = "en-US", completion: @escaping CompletionHandler) {
    invokedVideoOfMovie = true
    invokedVideoOfMovieCount += 1
    invokedVideoOfMovieParameters = (id, language, completion)
    invokedVideoOfMovieParametersList.append((id, language, completion))
  }
  var invokedSearchOfMovie = false
  var invokedSearchOfMovieCount = 0
  var invokedSearchOfMovieParameters: (keyword: String, page: String, language: String, completion: CompletionHandler)?
  var invokedSearchOfMovieParametersList = [(keyword: String, page: String, language: String, completion: CompletionHandler)]()
  override func searchOfMovie(keyword: String, page: String = "1",
  language: String = "en-US", completion: @escaping CompletionHandler) {
    invokedSearchOfMovie = true
    invokedSearchOfMovieCount += 1
    invokedSearchOfMovieParameters = (keyword, page, language, completion)
    invokedSearchOfMovieParametersList.append((keyword, page, language, completion))
  }
}
