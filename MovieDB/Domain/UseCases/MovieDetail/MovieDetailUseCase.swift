//
//  MovieDetailUseCase.swift
//  MovieDB
//
//  Created by William on 26/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class MovieDetailUseCase: MovieDetailUseCaseInterface {
  private let repository: MovieDetailRepositoryInterface

  init(repository: MovieDetailRepositoryInterface) {
    self.repository = repository
  }
}
