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
  private let movieId: Int?
  private let useCase: MovieDetailUseCaseInterface
  private let wireframe: MovieDetailWireframe

  init(movieId: Int?,
       useCase: MovieDetailUseCaseInterface, wireframe: MovieDetailWireframe) {
    self.movieId = movieId
    self.useCase = useCase
    self.wireframe = wireframe
  }
}
