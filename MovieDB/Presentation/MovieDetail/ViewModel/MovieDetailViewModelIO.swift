//
//  MovieDetailViewModelIO.swift
//  MovieDB
//
//  Created by William on 24/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol MovieDetailViewModelInput: class {
  func requestDetailMovie(movieId id: Int)
}

protocol MovieDetailViewModelOutput: class {
  var items: Observable<MovieDetail> { get }
  var isLoading: Observable<Bool> { get }
}
