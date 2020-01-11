//
//  ParentNavigation.swift
//  MovieDB
//
//  Created by William on 08/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class ParentNavigation: NSObject {
  var navigationController: UINavigationController?

  init(navigationController navController: UINavigationController?) {
    super.init()
  
    self.navigationController = navController
    self.initClass()
  }

  convenience override init() {
    self.init(navigationController: nil)

    initClass()
  }

  private func initClass() {
    if navigationController == nil {
      navigationController = UINavigationController()
      navigationController?.navigationBar.isTranslucent = false
    }
  }

  func setRootViewController(_ view: UIViewController?) -> [UIViewController]? {
    let test = [view].compactMap({$0})
    var root = navigationController?.viewControllers
    root = test
    return root
  }
}
