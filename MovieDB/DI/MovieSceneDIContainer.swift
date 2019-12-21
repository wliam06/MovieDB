//
//  MovieSceneDIContainer.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class MovieSceneDIContainer {
    init() {
    }

    func loadMovieUseCase() -> MovieUseCase {
        return MovieListUseCase(moviesRepository: loadMovieRepository())
    }

    func loadMovieRepository() -> MoviesRepository {
        return MovieListRepository()
    }

    func initMovieListViewController() -> UIViewController {
        return MovieListViewController.create(withViewModel: MovieViewModel(movieUseCase: loadMovieUseCase()))
    }
}
