//
//  MovieListUseCase.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

struct MovieUseCaseRequest {
    let movieList: MovieListPath
    let page: String
}

protocol MovieUseCase {
    func loadMovieListByType(movie: MovieUseCaseRequest,
                             completion: @escaping(Result<MoviePage, Error>) -> Void)
}

final class MovieListUseCase: MovieUseCase {
    private let moviesRepository: MoviesRepository

    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }

    /// Load movie list based on MovieListPath
    func loadMovieListByType(movie: MovieUseCaseRequest, completion: @escaping (Result<MoviePage, Error>) -> Void) {
        return moviesRepository.showMovieList(movie: movie.movieList, page: movie.page, completion: { [weak self] (result) in
            guard let self = self else { return }

            switch result {
            case .success:
                completion(result)
            case .failure:
                completion(result)
            }
        })
    }
}
