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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.navigationBar.isHidden = false
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = .blackPearl
  }
}
