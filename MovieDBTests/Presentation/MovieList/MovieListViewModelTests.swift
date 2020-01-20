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

  func testSuccessRequestNowPlayingMovie() {
    viewModel.requestMovieList(index: 0)

    XCTAssert(mockUsecase.invokedLoadMovieListByType == true, "Expect load movie list by type is called")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeCount == 1, "Expect load movie list by type is called once")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.movieList.path == "movie/now_playing", "Expect same param")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.page == "1", "Expect param is match")
  }

  func testSuccessRequestPopularMovie() {
    viewModel.requestMovieList(index: 1)

    XCTAssert(mockUsecase.invokedLoadMovieListByType == true, "Expect load movie list by type is called")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeCount == 1, "Expect load movie list by type is called once")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.movieList.path == "movie/popular", "Expect same param")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.page == "1", "Expect param is match")
  }

  func testSuccessRequestMovie() {
    viewModel.requestMovieList(index: 2)

    XCTAssert(mockUsecase.invokedLoadMovieListByType == true, "Expect load movie list by type is called")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeCount == 1, "Expect load movie list by type is called once")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.movieList.path == "movie/top_rated", "Expect same param")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.page == "1", "Expect param is match")
  }

  func testSuccessRequestUpcomingMovie() {
    viewModel.requestMovieList(index: 3)

    XCTAssert(mockUsecase.invokedLoadMovieListByType == true, "Expect load movie list by type is called")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeCount == 1, "Expect load movie list by type is called once")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.movieList.path == "movie/upcoming", "Expect same param")
    XCTAssert(mockUsecase.invokedLoadMovieListByTypeParameters?.movie.page == "1", "Expect param is match")
  }

  func testPerformanceExample() {
    self.measure {
        // Put the code you want to measure the time of here.
    }
  }

}
