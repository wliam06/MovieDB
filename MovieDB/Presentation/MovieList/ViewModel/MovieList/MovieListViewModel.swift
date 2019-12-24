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

  let items: Observable<[Movie]> = Observable([Movie]())

  var loadMore: Bool {
    return currentPage < totalPageCount
  }
  
  var nextPage: Int {
    guard loadMore else { return currentPage }
    return currentPage + 1
  }

  private let movieUseCase: MovieUseCase

  init(movieUseCase: MovieUseCase) {
    self.movieUseCase = movieUseCase
  }
  
  // MARK: - Input
  func requestMovieList() {
    load(movie: .nowPlaying, page: "1")
  }
  
  // MARK: - Private Method
  private func load(movie: MovieListPath, page: String) {
    let movieRequest = MovieUseCaseRequest(movieList: movie, page: page)
    movieUseCase.loadMovieListByType(movie: movieRequest) { [weak self] (result) in
      guard let self = self else { return }

      switch result {
      case .success(let data):
        self.currentPage = data.page
        self.totalPageCount = data.totalPages
        self.items.value = data.movies
        debugPrint("SUCCESS")
      case .failure(let error):
        debugPrint("FAILURE", error)
      }
    }
  }

}
