//
//  MovieListRepository.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import MovieSDK

final class MovieListRepository: MoviesRepository {
    func showMovieList(movie: MovieListPath, page: String,
                       completion: @escaping (Result<MoviePage, Error>) -> Void) {
        MovieListSession().listOfMove(movie: movie,
                                      page: page,
                                      language: "id",
                                      region: "ID",
                                      onComplete: { [weak self](result) in
                                        guard let self = self else { return }

                                   debugPrint("MovieListRepository")
        }) { [weak self] (error) in
            debugPrint("ERROR", error?.localizedDescription)
        }
    }
}
