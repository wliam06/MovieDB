//
//  MovieListViewModelTests.swift
//  MovieDBTests
//
//  Created by William on 19/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest
import MovieSDK

@testable import MovieDB
class MovieListViewModelTests: XCTestCase {
  var mockUsecase: MockMovieListUseCaseInterface!
  var viewModel: MovieListViewViewModel!

  override func setUp() {
    mockUsecase = MockMovieListUseCaseInterface()
    viewModel = MovieListViewViewModel(movieListUseCase: mockUsecase)
  }

  override func tearDown() {
    mockUsecase = nil
    viewModel = nil
  }

  func testSuccessRequestMovieList() {
    viewModel.requestMovieList(index: 0)

    let mockResource = MovieUseCaseResource(movieList: .nowPlaying, page: "1")

    XCTAssert(mockUsecase.invokedLoadMovieListByType == true, "Expect load movie list by type is called")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeCount == 1, "Expect load movie list by type is called once")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie == mockResource, "Expect same param")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.page == "1", "Expect param is match")
  }

  func testFailedRequestMovieList() {
    viewModel.requestMovieList(index: 4)

    XCTAssert(mockUsecase.invokedLoadMovieListByType == false, "Expect load movie list by type is called")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeCount == 0, "Expect load movie list by type is called once")
  }

  func testPerformanceExample() {
    self.measure {
        // Put the code you want to measure the time of here.
    }
  }

}
