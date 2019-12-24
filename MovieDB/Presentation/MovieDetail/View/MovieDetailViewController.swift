//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by William on 24/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
  var viewModel: MovieDetailViewModel!

  final class func create(with viewModel: MovieDetailViewModel) -> MovieDetailViewController {
    let view = MovieDetailViewController()
    view.viewModel = viewModel

    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }
}
