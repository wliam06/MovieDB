//
//  TabBarManager.swift
//  MovieDB
//
//  Created by William on 07/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

final class TabBarManager: UITabBarController {
  private let movieListWireframe: MovieListWireframe
  private let searchMovieWireframe: SearchMovieWireframe

  init() {
    movieListWireframe = MovieListWireframe()
    searchMovieWireframe = SearchMovieWireframe()

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  
    

    setViewControllers([movieListWireframe.controller,
                        searchMovieWireframe.controller], animated: false)
  }

  private func configureTab() {
    
  }
}
