//
//  MockMovieListViewModelOutput.swift
//  MovieDBTests
//
//  Created by William on 19/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest
import MovieSDK

@testable import MovieDB
class MockMovieListViewModelOutput: MovieListViewModelOutput {
  var invokedRouteGetter = false
  var invokedRouteGetterCount = 0
  var stubbedRoute: Observable<MovieListWireframeRoute>!
  var route: Observable<MovieListWireframeRoute> {
    invokedRouteGetter = true
    invokedRouteGetterCount += 1
    return stubbedRoute
  }
  var invokedItemsGetter = false
  var invokedItemsGetterCount = 0
  var stubbedItems: Observable<[Movie]>!
  var items: Observable<[Movie]> {
    invokedItemsGetter = true
    invokedItemsGetterCount += 1
    return stubbedItems
  }
  var invokedIsLoadingGetter = false
  var invokedIsLoadingGetterCount = 0
  var stubbedIsLoading: Observable<MovieListViewModelLoading>!
  var isLoading: Observable<MovieListViewModelLoading> {
    invokedIsLoadingGetter = true
    invokedIsLoadingGetterCount += 1
    return stubbedIsLoading
  }
  var invokedTypeGetter = false
  var invokedTypeGetterCount = 0
  var stubbedType: Observable<MoviePath>!
  var type: Observable<MoviePath> {
    invokedTypeGetter = true
    invokedTypeGetterCount += 1
    return stubbedType
  }
}
