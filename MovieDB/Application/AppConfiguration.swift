//
//  AppConfiguration.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

final class AppConfiguration {
  lazy var apiKey: String = {
    guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
      fatalError("ApiKey is empty")
    }
    return apiKey
  }()

  lazy var baseURL: String = {
    guard let url = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
      fatalError("ApiBaseURL is empty")
    }
    return url
  }()

  lazy var imageBaseURL: String = {
    guard let url = Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as? String else {
      fatalError("ImageBaseURL is empty")
    }
    return url
  }()
}
