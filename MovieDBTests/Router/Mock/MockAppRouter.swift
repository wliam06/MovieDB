//
//  MockAppRouter.swift
//  MovieDBTests
//
//  Created by William on 01/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB

final class MockAppRouter {
  var navigationStack: [UIViewController] = []
  var presented: UIViewController?
  var completions: [UIViewController : () -> Void] = [:]

  private func runCompletion(for controller: UIViewController) {
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
}

extension MockAppRouter: MockRouter {
  public func toPresent() -> UIViewController? {
    return nil
  }

  public func present(_ module: Presentable?) {
    present(module, animated: true)
  }

  public func present(_ module: Presentable?, animated: Bool) {
    guard let controller = module?.toPresent() else { return }
    presented = controller
  }

  public func push(_ module: Presentable?) {
    push(module, animated: true)
  }
  
  public func push(_ module: Presentable?, hideBottomBar: Bool) {
    push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
  }
  
  public func push(_ module: Presentable?, animated: Bool) {
    push(module, animated: animated, completion: nil)
  }
  
  public func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
    guard let controller = module?.toPresent(), (controller is UINavigationController == false) else {
      assertionFailure("Navigation Push is Empty")
      return
    }

    navigationStack.append(controller)
  }
  
  public func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
    guard let controller = module?.toPresent(), (controller is UINavigationController == false) else {
      assertionFailure("Navigation Push is Empty")
      return
    }

    controller.hidesBottomBarWhenPushed = hideBottomBar
    navigationStack.append(controller)
  }
  
  public func popModule() {
    popModule(animated: false)
  }
  
  public func popModule(animated: Bool) {
    let controller = navigationStack.removeLast()
    runCompletion(for: controller)
  }
  
  public func dismissModule() {
    dismissModule(animated: false, completion: nil)
  }
  
  public func dismissModule(animated: Bool, completion: (() -> Void)?) {
    presented = nil
  }
  
  public func setRootModule(_ module: Presentable?) {
    guard let controller = module?.toPresent() else { return }
    navigationStack.append(controller)
  }
  
  public func setRootModule(_ module: Presentable?, hideBar: Bool) {
    assertionFailure("This method is not used.")
  }
  
  public func popToRootModule(animated: Bool) {
    guard let firstVC = navigationStack.first else { return }

    navigationStack.forEach { controller in
      runCompletion(for: controller)
    }

    navigationStack = [firstVC]
  }
}
