//
//  LaunchScreenViewController.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

final class LaunchScreenViewController: UIViewController, StoryboardInstantiable {
  private let launchView: LaunchScreenView = LaunchScreenView.build()

  private var viewModel: LaunchScreenViewModel!

  static func create(withViewModel viewModel: LaunchScreenViewModel) -> LaunchScreenViewController {
    let view = LaunchScreenViewController.instantiateViewController()
    view.viewModel = viewModel
    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    configureLayout()

    viewModel.fetchUserData()
  }
}

// MARK: - Configure UI
extension LaunchScreenViewController {
  private func configureLayout() {
//    view.addSubview(launchView)
//    NSLayoutConstraint.activate([
//      launchView.topAnchor.constraint(equalTo: view.topAnchor),
//      launchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      launchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      launchView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//    ])
  }
}
