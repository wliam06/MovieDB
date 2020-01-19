//
//  MovieListRepositoryInterface.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

protocol MovieListRepositoryInterface: class {
  func showMovieList(movie: MoviePath, page: String, completion: @escaping(Result<MoviePage, Error>) -> Void)
}
