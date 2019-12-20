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

    func initMovieListViewController() -> UIViewController {
        return MovieListViewController.create(withViewModel: MovieViewModel())
    }
}
