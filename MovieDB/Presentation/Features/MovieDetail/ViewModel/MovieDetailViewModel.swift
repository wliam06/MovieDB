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

  let items: Observable<MovieDetail> = Observable(MovieDetail(json: [:]))
  var isLoading: Observable<Bool> = Observable(true)

  init(movieId: Int?,
       useCase: MovieDetailUseCaseInterface, wireframe: MovieDetailWireframe) {
    self.movieId = movieId
    self.useCase = useCase
    self.wireframe = wireframe
  }

  // MARK: - Input
  func requestDetailMovie(movieId id: Int) {
    useCase.loadMovieDetail(movieId: id) { (result) in
      switch result {
      case .success(let data):
        debugPrint("SUCCESS REQUEST MOVIE DETAIL", data)
        self.items.value = data
        self.isLoading.value = false
        return
      case .failure(let error):
        debugPrint("ERROR REQUEST MOVIE DETAIL", error.localizedDescription)
        return
      }
    }
  }
}
