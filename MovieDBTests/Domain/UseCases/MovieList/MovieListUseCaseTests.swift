//
//  MovieListUseCaseTests.swift
//  MovieDBTests
//
//  Created by William on 18/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest
import MovieSDK
@testable import MovieDB

enum ErrorTest: Error {
  case invalid
}

class MovieListUseCaseTests: XCTestCase {
  var mockRepository: MockMovieListRepositoryInterface!
  var usecase: MovieListUseCase!

  override func setUp() {
    mockRepository = MockMovieListRepositoryInterface()
    usecase = MovieListUseCase(moviesRepository: mockRepository)
  }

  override func tearDown() {
    super.tearDown()
  }

  func testInvalidRequestMovieList() {
    let mockResource = MovieUseCaseResource(movieList: .popular, page: "1")

    mockRepository.stubbedShowMovieListCompletionResult = (.failure(ErrorTest.invalid), ())

    let usecase = MovieListUseCase(moviesRepository: mockRepository)
    usecase.loadMovieListByType(movie: mockResource) { (_) in
    }

    XCTAssert(mockRepository.invokedShowMovieList == true, "Expect show movie list is called")
    XCTAssert(mockRepository.invokedShowMovieListCount == 1, "Expect show movie list is called once")
  }

  func testSuccessRequestMovieList() {
    let mockResource = MovieUseCaseResource(movieList: .popular, page: "1")
    var mockMoviepage = MoviePage(with: ["page": 1, "totalPages": 1, "movies": []])

    mockRepository.stubbedShowMovieListCompletionResult = (.success(mockMoviepage), ())

    let usecase = MovieListUseCase(moviesRepository: mockRepository)
    usecase.loadMovieListByType(movie: mockResource) { (_) in
    }

    XCTAssert(mockRepository.invokedShowMovieList == true, "Expect show movie list is called")
    XCTAssert(mockRepository.invokedShowMovieListCount == 1, "Expect show movie list is called once")
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
        // Put the code you want to measure the time of here.
    }
  }

}
