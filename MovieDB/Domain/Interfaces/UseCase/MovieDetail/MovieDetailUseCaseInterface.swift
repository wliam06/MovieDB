//
//  MovieDetailUseCaseInterface.swift
//  MovieDB
//
//  Created by William on 26/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol MovieDetailUseCaseInterface {
  func loadMovieDetail(movieId: Int, completion: @escaping(Result<MovieDetail, Error>) -> Void)
}
