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
  func requestMovieList(index: Int)

  func movieDidTapped(withId id: Int)

  func didLoadNextPage()
}

protocol MovieListViewModelOutput: class {
  var route: Observable<MovieListWireframeRoute> { get }
  var items: Observable<[Movie]> { get }
  var isLoading: Observable<MovieListViewModelLoading> { get }
  var type: Observable<MoviePath> { get }
}
