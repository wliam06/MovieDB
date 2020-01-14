//
//  TabBarManager.swift
//  MovieDB
//
//  Created by William on 07/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

enum TabBarIndex: Int {
  case list
  case search
}

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

    configureTab()
  
    setViewControllers([movieListWireframe.controller,
                        searchMovieWireframe.controller], animated: false)
  }

  private func configureTab() {
    // Make tab bar background white
    tabBar.isTranslucent = false

    // Give shadow to tab bar
    tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
    tabBar.layer.shadowRadius = 10
    tabBar.layer.shadowColor = UIColor.black.cgColor
    tabBar.layer.shadowOpacity = 0.3

    // Remove top line at tab bar
    tabBar.shadowImage = UIImage()
    tabBar.backgroundImage = UIImage()
  }
}
