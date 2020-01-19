//
//  MovieListUseCaseInterface.swift
//  MovieDB
//
//  Created by William on 26/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol MovieListUseCaseInterface: class {
  func loadMovieListByType(movie: MovieUseCaseResource,
                           completion: @escaping(Result<MoviePage, Error>) -> Void)
}
