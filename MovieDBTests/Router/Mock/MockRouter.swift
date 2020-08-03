//
//  MockRouter.swift
//  MovieDBTests
//
//  Created by William on 01/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB
protocol MockRouter: Router {
  var navigationStack: [UIViewController] { get }
  var presented: UIViewController? { get }
}
