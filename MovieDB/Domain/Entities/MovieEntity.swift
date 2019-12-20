//
//  MovieEntity.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct MoviePage {
    let page: Int
    let totalPages: Int
}

typealias MovieId = String

struct Movie {
    let id: MovieId
    let title: String
    let posterPath: String?
    let overview: String
    let releaseDate: Date?
}

extension Movie: Hashable {
    func has(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
