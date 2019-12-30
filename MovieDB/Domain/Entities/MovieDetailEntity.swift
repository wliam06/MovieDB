//
//  MovieDetailEntity.swift
//  MovieDB
//
//  Created by William on 26/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct MovieDetail {
  dynamic var id: Int = 0
  dynamic var genre: [MovieGenre] = []
  dynamic var title: String = ""
  dynamic var status: String = ""
  dynamic var releaseDate: String = ""
  dynamic var overview: String = ""
  dynamic var posterPath: String = ""
  dynamic var backdropPath: String = ""
  dynamic var homepage: String = ""

  init(json: Dictionary<String, Any>) {
    if let id = json["id"] as? Int {
      self.id = id
    }
    if let genres = json["genres"] as? [[String: Any]] {
      for genre in genres {
        let movieGenre = MovieGenre(json: genre)
        self.genre.append(movieGenre)
      }
    }
    if let title = json["title"] as? String {
      self.title = title
    }
    if let status = json["status"] as? String {
      self.status = status
    }
    if let releaseDate = json["releaseDate"] as? String {
      self.releaseDate = releaseDate
    }
    if let overview = json["overview"] as? String {
      self.overview = overview
    }
    if let posterPath = json["posterPath"] as? String {
      self.posterPath = "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    if let backdropPath = json["backdropPath"] as? String {
      self.backdropPath = "https://image.tmdb.org/t/p/original\(backdropPath)"
    }
    if let homepage = json["homepage"] as? String {
      self.homepage = homepage
    }
    
  }
}

struct MovieGenre {
  dynamic var id: Int = 0
  dynamic var title: String = ""

  init(json: Dictionary<String, Any>) {
    if let id = json["id"] as? Int {
      self.id = id
    }
    if let title = json["title"] as? String {
      self.title = title
    }

  }
}
