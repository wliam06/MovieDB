//
//  BaseCoordinatorTests.swift
//  MovieDBTests
//
//  Created by William on 04/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB
class BaseCoordinatorTests: XCTestCase {
  private var coordinator: BaseCoordinator!
  private var mockCoordinator: MockBaseCoordinator!

  override func setUp() {
    super.setUp()
    coordinator = BaseCoordinator()
  }

  override func tearDown() {
    coordinator = nil
    super.tearDown()
  }

  func test_coordinatorWithEmptyChild() {
    XCTAssertTrue(coordinator.childCoordinators.isEmpty)
  }

  func test_coordinatorAddDependency() {
    coordinator.addDependency(coordinator)

    XCTAssertTrue(coordinator.childCoordinators.first is BaseCoordinator)
    XCTAssertTrue(coordinator.childCoordinators.count == 1, "Only unique reference could be added")

    let newCoordinator = BaseCoordinator()
    coordinator.addDependency(newCoordinator)
    XCTAssertTrue(coordinator.childCoordinators.count == 2)
  }

  func test_coordinatorRemoveDependency() {
    coordinator.addDependency(coordinator)
    XCTAssertTrue(coordinator.childCoordinators.first is BaseCoordinator)

    coordinator.removeDependency(coordinator)
    XCTAssertTrue(coordinator.childCoordinators.isEmpty)
  }

//  func test_coordinatorStart() {
//    coordinator.start()
//
//    XCTAssertTrue(mockCoordinator.invokedStart)
//    XCTAssertTrue(mockCoordinator.invokedStartCount == 1)
//  }
}
