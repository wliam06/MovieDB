//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by William on 24/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol MovieDetailViewModel: MovieDetailViewModelInput, MovieDetailViewModelOutput {}

class MovieDetailViewViewModel: MovieDetailViewModel {
  private let movieId: Int

  init(movieId: Int) {
    self.movieId = movieId
  }  
}
