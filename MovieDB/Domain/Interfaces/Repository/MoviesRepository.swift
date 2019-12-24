//
//  MoviesRepository.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

protocol MoviesRepository {
  @discardableResult
  func showMovieList(movie: MovieListPath, page: String, completion: @escaping(Result<MoviePage, Error>) -> Void)
}
