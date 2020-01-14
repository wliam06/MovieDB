//
//  SearchMovieWireframe.swift
//  MovieDB
//
//  Created by William on 07/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class SearchMovieWireframe: Router {
  var controller: UIViewController {
    let view = SearchMovieViewController()
    let repository = SearchMovieRepository()
    let usecase = SearchMovieUseCase(repository: repository)
    let viewModel = SearchMovieViewViewModel(usecase: usecase)
    let navigationController = UINavigationController(rootViewController: view)
    navigationController.tabBarItem.title = "Search"

    view.viewModel = viewModel

    return navigationController
  }
}
