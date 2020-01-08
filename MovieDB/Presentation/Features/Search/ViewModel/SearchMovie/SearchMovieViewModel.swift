//
//  SearchMovieViewModel.swift
//  MovieDB
//
//  Created by William on 07/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

protocol SearchMovieViewModel: SearchMovieViewModelInput, SearchMovieViewModelOutput {}

final class SearchMovieViewViewModel: SearchMovieViewModel {
  private let usecase: SearchMovieUseCaseInterface

  init(usecase: SearchMovieUseCaseInterface) {
    self.usecase = usecase
  }
}
