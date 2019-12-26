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
  private let useCase: MovieDetailUseCaseInterface

  init(movieId: Int, useCase: MovieDetailUseCaseInterface) {
    self.movieId = movieId
    self.useCase = useCase
  }  
}
