//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

final class MovieListViewController: UIViewController {
  private var viewModel: MovieListViewModel!

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "MovieListViewController"
    label.font = .systemFont(ofSize: 36)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  static func create(withViewModel viewModel: MovieListViewModel) -> MovieListViewController {
    let view = MovieListViewController()
    view.viewModel = viewModel
    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemBlue
    self.view.addSubview(titleLabel)

    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ])
  }
}

