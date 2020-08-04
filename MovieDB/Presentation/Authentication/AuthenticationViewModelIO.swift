//
//  AuthenticationViewModelIO.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

protocol AuthenticationViewModelInput: class {
  func loginDidTapped()
}

protocol AuthenticationViewModelOutput: class {}

protocol AuthenticationViewModel: AuthenticationViewModelInput, AuthenticationViewModelOutput {}
