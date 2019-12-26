//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

protocol MovieListViewModel: MovieListViewModelInput, MovieListViewModelOutput {}

final class MovieListViewViewModel: MovieListViewModel {
  private(set) var currentPage = 0
  private var totalPageCount = 0

  let route: Observable<MovieListViewModelRoute> = Observable(.initial)
  let items: Observable<[Movie]> = Observable([Movie]())
  let isLoading: Observable<Bool> = Observable(true)

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
  func requestMovieList(movieType type: MovieListPath, page: String, isLoading: Bool) {
    load(movie: type, page: page, isLoading: isLoading)
  }

  func movieDidTapped(withId id: Int) {
    route.value = .navigateToDetail(withID: id)
  }
  
  // MARK: - Private Method
  private func load(movie: MovieListPath, page: String, isLoading: Bool) {
    let movieRequest = MovieUseCaseResource(movieList: movie, page: page)
    movieListUseCase.loadMovieListByType(movie: movieRequest) { [weak self] (result) in
      guard let self = self else { return }

      switch result {
      case .success(let data):
        self.currentPage = data.page
        self.totalPageCount = data.totalPages
        self.items.value = data.movies
        self.isLoading.value = data.movies.count > 0
        debugPrint("SUCCESS")
      case .failure(let error):
        debugPrint("FAILURE", error)
      }
    }
  }
}
