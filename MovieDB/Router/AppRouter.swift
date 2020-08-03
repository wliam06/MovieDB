//
//  AppRouter.swift
//  MovieDB
//
//  Created by William on 01/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class AppRouter: NSObject {
  public weak var rootController: UINavigationController?
  private var completions: [UIViewController: () -> Void] = [:]

  init(rootController: UINavigationController) {
    self.rootController = rootController
  }

  private func removeCompletions(for controller: UIViewController) {
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
}

// MARK: - Router
extension AppRouter: Router {
  func toPresent() -> UIViewController? {
    return rootController
  }

  func present(_ module: Presentable?) {
    present(module, animated: true)
  }

  func present(_ module: Presentable?, animated: Bool) {
    guard let controller = module?.toPresent() else { return }
    rootController?.present(controller, animated: animated, completion: nil)
  }

  func push(_ module: Presentable?) {
    push(module, animated: true)
  }
  
  func push(_ module: Presentable?, hideBottomBar: Bool) {
    push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
  }
  
  func push(_ module: Presentable?, animated: Bool) {
    push(module, animated: animated, completion: nil)
  }
  
  func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
    push(module, animated: animated, hideBottomBar: false, completion: completion)
  }

  func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
    guard let controller = module?.toPresent(), (controller is UINavigationController == false) else {
      #if DEBUG
      print("Navigation Push is empty")
      #endif
      return
    }

    // Add Completion
    if let completion = completion {
      completions[controller] = completion
    }

    controller.hidesBottomBarWhenPushed = hideBottomBar
    rootController?.pushViewController(controller, animated: animated)
  }
  
  func popModule() {
    popModule(animated: true)
  }
  
  func popModule(animated: Bool) {
    if let controller = rootController?.popViewController(animated: animated) {
      removeCompletions(for: controller)
    }
  }
  
  func dismissModule() {
    dismissModule(animated: true, completion: nil)
  }
  
  func dismissModule(animated: Bool, completion: (() -> Void)?) {
    rootController?.dismiss(animated: animated, completion: completion)
  }

  func setRootModule(_ module: Presentable?) {
    setRootModule(module, hideBar: false)
  }

  func setRootModule(_ module: Presentable?, hideBar: Bool) {
    guard let controller = module?.toPresent() else { return }
    rootController?.setViewControllers([controller], animated: true)
    rootController?.isNavigationBarHidden = hideBar
  }

  func setRootModule(_ module: Presentable?, hideBar: Bool, animated: Bool) {
    guard let controller = module?.toPresent() else { return }
    rootController?.setViewControllers([controller], animated: animated)
    rootController?.isNavigationBarHidden = hideBar
  }
  
  func popToRootModule(animated: Bool) {
    if let rootControllers = rootController?.popToRootViewController(animated: animated) {
      rootControllers.forEach { controller in removeCompletions(for: controller) }
    }
  }
}
