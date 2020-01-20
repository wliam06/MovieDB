//
//  MovieListRepositoryTests.swift
//  MovieDBTests
//
//  Created by William on 20/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest
import MovieSDK
@testable import MovieDB

class MovieListRepositoryTests: XCTestCase {
  var mockMovieService: MockMovieService!
  var mockRepository: MockMovieListRepositoryInterface!
  var repository: MovieListRepository!

  override func setUp() {
    mockMovieService = MockMovieService()
    mockRepository = MockMovieListRepositoryInterface()
    repository = MovieListRepository()
  }

  override func tearDown() {
    mockMovieService = nil
    repository = nil

    super.tearDown()
  }

  func testShowMovieListSuccess() {
    mockRepository.stubbedShowMovieListCompletionResult = (.failure(ErrorTest.invalid), ())

  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
        // Put the code you want to measure the time of here.
    }
  }
}
