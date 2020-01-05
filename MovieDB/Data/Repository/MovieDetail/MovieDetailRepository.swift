//
//  MovieDetailRepository.swift
//  MovieDB
//
//  Created by William on 26/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

final class MovieDetailRepository: MovieDetailRepositoryInterface {
  func requestMovieDetail(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
     Movies().detailOfMovie(withID: movieId) { [weak self] (response) in
      switch response {
      case .success(let data):
        if let dict = data as? [String: Any] {
          let movieResponse = MovieDetail(json: dict)
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
