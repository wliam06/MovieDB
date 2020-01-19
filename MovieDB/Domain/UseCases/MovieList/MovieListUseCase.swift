//
//  MovieListUseCase.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

struct MovieUseCaseResource: Equatable {
  let movieList: MoviePath
  let page: String

  static func == (lhs: MovieUseCaseResource, rhs: MovieUseCaseResource) -> Bool {
    return lhs.page == rhs.page
  }
}

final class MovieListUseCase: MovieListUseCaseInterface {
  private let moviesRepository: MovieListRepositoryInterface

  init(moviesRepository: MovieListRepositoryInterface) {
    self.moviesRepository = moviesRepository
  }

  /// Load movie list based on MoviePath
  func loadMovieListByType(movie: MovieUseCaseResource, completion: @escaping(Result<MoviePage, Error>) -> Void) {
    return moviesRepository.showMovieList(movie: movie.movieList, page: movie.page, completion: { (result) in
      switch result {
      case .success(let data):
        completion(.success(data))
      case .failure(let error):
        completion(.failure(error))
      }
    })
  }
}
