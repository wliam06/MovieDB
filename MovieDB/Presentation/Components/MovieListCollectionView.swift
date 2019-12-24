//
//  MovieListCollectionView.swift
//  MovieDB
//
//  Created by William on 21/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class MovieListCollectionView: UICollectionViewController {
    var activityIndicator: UIActivityIndicatorView?

    var viewModel: MovieListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
    }

    func reload() {
        self.reload()
    }

    private func bind(to viewModel: MovieListViewModel) {
        
    }
}
