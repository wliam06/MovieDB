//
//  MovieDetail.swift
//  MovieSDK
//
//  Created by William on 26/12/19.
//

import Foundation

public struct MovieDetailResponse: Codable {
  public let id: Int
  public let imdbId: String
  public let backdropPath: String
  public let genres: [Genres]
  public let homepage: String
  public let overview: String
  public let popularity: Double
  public let posterPath: String
  public let releaseDate: String
  public let status: String
  public let title: String
  public let voteAverage: Float
  public let voteCount: Int
}

public struct Genres: Codable {
  public let id: Int
  public let name: String
}
