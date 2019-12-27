//
//  MovieListViewModelO.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

protocol MovieListViewModelInput: class {
  func requestMovieList(movieType type: MovieListPath, page: String, isLoading: Bool)

  func movieDidTapped(withId id: Int)
}

protocol MovieListViewModelOutput: class {
  var route: Observable<MovieListViewModelRoute> { get }
  var items: Observable<[Movie]> { get }
  var isLoading: Observable<Bool> { get }
}
