//
//  MovieListViewModelO.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol MovieListViewModelInput: class {
  func requestMovieList()

  func movieDidTapped(withId id: Int)
}

protocol MovieListViewModelOutput: class {
  var route: Observable<MovieListViewModelRoute> { get }
  var items: Observable<[Movie]> { get }
}
