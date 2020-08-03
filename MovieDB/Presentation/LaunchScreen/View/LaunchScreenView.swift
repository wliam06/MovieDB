//
//  LaunchScreenView.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class LaunchScreenView: UIView {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "WELCOME"
    label.font = .systemFont(ofSize: 32, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    return label
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
    
    addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
      titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
    ])
  }

}
