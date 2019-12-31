//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by William on 24/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
  @IBOutlet weak var movieImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descLabel: UILabel!

  private var movieId: Int

  var viewModel: MovieDetailViewModel?

  init(movieId: Int) {
    self.movieId = movieId

    super.init(nibName: String(describing: MovieDetailViewController.self), bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.navigationBar.isHidden = false
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = .blackPearl

    viewModel?.requestDetailMovie(movieId: movieId)
    bind(to: viewModel)
  }

  private func bind(to viewModel: MovieDetailViewModel?) {
    viewModel?.items.observe(on: self, observerBlock: { [weak self] in self?.getMovieDetail(data: $0)})
  }

  private func getMovieDetail(data: MovieDetail) {
    let url = URL(string: data.posterPath)
    movieImageView.loadImageWithURL(url: url)

    titleLabel.text = data.title
    descLabel.text = data.overview
  }
}
