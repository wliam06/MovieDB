//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by William on 19/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    private(set) var viewModel: MovieListViewModel!

    final class func create(withViewModel viewModel: MovieListViewModel) -> MovieListViewController {
        let view = MovieListViewController()
        view.viewModel = viewModel

        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
