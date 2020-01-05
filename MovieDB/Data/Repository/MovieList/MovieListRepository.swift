//
//  MovieListRepository.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

final class MovieListRepository: MovieListRepositoryInterface {
  func showMovieList(movie: MovieListPath, page: String, completion: @escaping (Result<MoviePage, Error>) -> Void) {
    Movies().listOfMovie(movie: movie, page: page) { [weak self] (response) in
      switch response {
      case .success(let data):
        if let dict = data as? [String: Any] {
          let movieResponse = MoviePage(with: dict)
          completion(.success(movieResponse))
        }
        return
      case .failure(let error):
        completion(.failure(error))
        return
      }
    }
  }

}
