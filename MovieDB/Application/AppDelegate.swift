//
//  AppDelegate.swift
//  MovieDB
//
//  Created by William on 19/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private let navigationController = UINavigationController()
  private var appCoordinator: AppFlowCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController

    appCoordinator = AppFlowCoordinator(router: AppRouter(rootController: navigationController),
                                        DIContainer: AppDIContainer())
    appCoordinator?.start()
    window?.makeKeyAndVisible()
    return true
  }
}
