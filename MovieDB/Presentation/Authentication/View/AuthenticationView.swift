//
//  AuthenticationView.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class AuthenticationView: UIView {
  private let stackView: UIStackView = {
    return UIStackView.build() { stack in
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.axis = NSLayoutConstraint.Axis.vertical
    }
  }()

  private lazy var titleLabel: UILabel = {
    return UILabel.build() { label in
      label.text = "AuthenticationView"
      label.font = .systemFont(ofSize: 32, weight: .bold)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textAlignment = .center
    }
  }()

  private lazy var loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    configureLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureLayout() {
    self.backgroundColor = .white

    addSubview(stackView)
    
    stackView.spacing = 20
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(loginButton)

    applyConstraints()
  }

  private func applyConstraints() {
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
  }
}
