//
//  MockMovieListViewModelInput.swift
//  MovieDBTests
//
//  Created by William on 19/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB
class MockMovieListViewModelInput: MovieListViewModelInput {
  var invokedRequestMovieList = false
  var invokedRequestMovieListCount = 0
  var invokedRequestMovieListParameters: (index: Int, Void)?
  var invokedRequestMovieListParametersList = [(index: Int, Void)]()
  func requestMovieList(index: Int) {
    invokedRequestMovieList = true
    invokedRequestMovieListCount += 1
    invokedRequestMovieListParameters = (index, ())
    invokedRequestMovieListParametersList.append((index, ()))
  }
  var invokedMovieDidTapped = false
  var invokedMovieDidTappedCount = 0
  var invokedMovieDidTappedParameters: (id: Int, Void)?
  var invokedMovieDidTappedParametersList = [(id: Int, Void)]()
  func movieDidTapped(withId id: Int) {
    invokedMovieDidTapped = true
    invokedMovieDidTappedCount += 1
    invokedMovieDidTappedParameters = (id, ())
    invokedMovieDidTappedParametersList.append((id, ()))
  }
  var invokedDidLoadNextPage = false
  var invokedDidLoadNextPageCount = 0
  func didLoadNextPage() {
    invokedDidLoadNextPage = true
    invokedDidLoadNextPageCount += 1
  }
}
