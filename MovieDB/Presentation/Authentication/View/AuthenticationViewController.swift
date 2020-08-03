//
//  AuthenticationViewController.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

final class AuthenticationViewController: UIViewController {
  private var authView: AuthenticationView = AuthenticationView.build()
  private var viewModel: AuthenticationViewModel!

  static func create(withViewModel viewModel: AuthenticationViewModel) -> AuthenticationViewController {
    let view = AuthenticationViewController()
    view.viewModel = viewModel
    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.addSubview(authView)
    NSLayoutConstraint.activate([
      authView.topAnchor.constraint(equalTo: self.view.topAnchor),
      authView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      authView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      authView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
    ])
  }
}
