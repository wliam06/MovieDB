//
//  MovieDetailRepositoryInterface.swift
//  MovieDB
//
//  Created by William on 26/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol MovieDetailRepositoryInterface: class {
  func requestMovieDetail(movieId: Int, completion: @escaping(Result<MovieDetail, Error>) -> Void)
}
