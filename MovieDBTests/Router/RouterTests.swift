//
//  RouterTests.swift
//  MovieDBTests
//
//  Created by William on 01/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB

class FirstController: UIViewController {}
class SecondController: UIViewController {}
class ThirdController: UIViewController {}

class RouterTests: XCTestCase {
  private var router: MockRouter!

  private var firstController: UIViewController!
  private var secondController: UIViewController!
  private var thirdController: UIViewController!
  private var fourthController: UIViewController!

  override func setUp() {
    super.setUp()
    router = MockAppRouter()
    let appRouter = AppRouter(rootController: UINavigationController())

    firstController = FirstController()
    secondController = SecondController()
    thirdController = ThirdController()
  }

  override func tearDown() {
    router = nil
    firstController = nil
    secondController = nil

    super.tearDown()
  }

  func test_RouterSetRootModule() {
    router.setRootModule(firstController)
    XCTAssertTrue(router.navigationStack.first is FirstController)
  }

  func test_RouterPushViewModule() {
    router.setRootModule(firstController)
    XCTAssertTrue(router.navigationStack.last is FirstController)

    router.push(secondController)
    XCTAssertTrue(router.navigationStack.last is SecondController)
  }

  func test_RouterPopViewModule() {
    router.setRootModule(firstController)
    XCTAssertTrue(router.navigationStack.last is FirstController)

    router.push(secondController)
    XCTAssertTrue(router.navigationStack.last is SecondController)

    router.popModule()
    XCTAssertTrue(router.navigationStack.last is FirstController)
  }

  func test_RouterPopToRootViewModule() {
    router.setRootModule(firstController)
    XCTAssertTrue(router.navigationStack.last is FirstController)

    router.push(secondController)
    XCTAssertTrue(router.navigationStack.last is SecondController)

    router.push(thirdController)
    XCTAssertTrue(router.navigationStack.last is ThirdController)

    router.popToRootModule(animated: false)
    XCTAssertTrue(router.navigationStack.last is FirstController)
  }

  func test_RouterPresentViewModule() {
    router.present(secondController)
    XCTAssertTrue(router.presented is SecondController)
  }

  func test_RouterDismissViewModule() {
    router.present(secondController)
    XCTAssertTrue(router.presented is SecondController)

    router.dismissModule()
    XCTAssertTrue(router.presented == nil)
  }
}
