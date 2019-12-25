//
//  ThemeManager.swift
//  MovieDB
//
//  Created by William on 25/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class ThemeManager {
  static func applyTheme() {
    let navBar = UINavigationBar.appearance()
    navBar.setBackgroundImage(UIImage(), for: .default)
    navBar.shadowImage = UIImage()
    navBar.backgroundColor = .clear
    navBar.tintColor = .white
    navBar.barStyle = .black
  }
}
