//
//  SearchMovieUseCase.swift
//  MovieDB
//
//  Created by William on 07/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

final class SearchMovieUseCase: SearchMovieUseCaseInterface {
  private let repository: SearchMovieRepositoryInterface

  // MARK: - Init
  init(repository: SearchMovieRepositoryInterface) {
    self.repository = repository
  }
}
