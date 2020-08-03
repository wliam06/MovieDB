//
//  AuthenticationViewModel.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

struct AuthenticationClosures {
  var showMovieList: (() -> Void)?
}

final class DefaultAuthenticationViewModel: AuthenticationViewModel {
}
