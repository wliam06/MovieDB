//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

enum MovieListViewModelLoading {
  case none
  case currentPage
  case nextPage
}

protocol MovieListViewModel: MovieListViewModelInput, MovieListViewModelOutput {}

final class MovieListViewViewModel: MovieListViewModel {
  private(set) var currentPage = 0
  private var totalPageCount = 1

  let route: Observable<MovieListWireframeRoute> = Observable(.initial)
  let items: Observable<[Movie]> = Observable([Movie]())
  let type: Observable<MoviePath> = Observable(.nowPlaying)
  let isLoading: Observable<MovieListViewModelLoading> = Observable(.none)

  var loadMore: Bool {
    return currentPage < totalPageCount
  }

  var nextPage: Int {
    guard loadMore else { return currentPage }
    return currentPage + 1
  }

  private let movieListUseCase: MovieListUseCaseInterface

  init(movieListUseCase: MovieListUseCaseInterface) {
    self.movieListUseCase = movieListUseCase
  }

  // MARK: - Input
  func requestMovieList(index: Int) {
    switch index {
    case 0: // Now Playing
      updateMovie(movie: .nowPlaying)
    case 1: // Popular
      updateMovie(movie: .popular)
    case 2: // Top Rated
      updateMovie(movie: .topRated)
    case 3: // Upcoming
      updateMovie(movie: .upcoming)
    default:
      return
    }
  }

  func didLoadNextPage() {
    guard loadMore, isLoading.value == .none else { return }

    load(movie: self.type.value, isLoading: .nextPage)
  }

  func movieDidTapped(withId id: Int) {
    route.value = .navigateToDetail(withID: id)
  }

  // MARK: - Private Method
  private func updateMovie(movie: MoviePath) {
    clearData()

    load(movie: movie, isLoading: .currentPage)
  }

  private func load(movie: MoviePath, isLoading: MovieListViewModelLoading) {
    self.type.value = movie
    self.isLoading.value = isLoading

    let movieRequest = MovieUseCaseResource(movieList: movie, page: "\(nextPage)")
    movieListUseCase.loadMovieListByType(movie: movieRequest) { [weak self] (result) in
      guard let self = self else { return }

      switch result {
      case .success(let data):
        self.currentPage = data.page
        self.totalPageCount = data.totalPages
        self.items.value = self.items.value + data.movies
      case .failure(let error):
        debugPrint("FAILURE", error)
      }

      self.isLoading.value = .none
    }
  }

  private func clearData() {
    currentPage = 0
    totalPageCount = 1
    items.value.removeAll()
  }
}
