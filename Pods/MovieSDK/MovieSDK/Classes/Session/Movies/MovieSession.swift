//
//  MovieSession.swift
//  MovieSDK
//
//  Created by William on 05/01/20.
//

import Foundation

open class Movies {
  public init() {}


  /// List of movies based on status ( Now Playing, Popular, Top Rated, Upcoming )
  /// - Parameter movie: Movie status
  /// - Parameter page (optional): Movie list of page, by default page is `1`
  /// - Parameter language (optional): Movie language description, by default language is `en-US`
  /// - Parameter completion: Movie response contains success and failed (error)
  open func listOfMovie(movie: MoviePath, page: String = "1", language: String = "en-US",
                       completion: @escaping CompletionHandler) {
    let param: [String: String] = ["language": language, "page": page]

    ServiceManager.api.load(urlPath: movie.path, queryItems: param, method: .GET, body: nil) { (data, error) in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data else { return }

      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      do {
        let movieResponse = try decoder.decode(MoviesResponse.self, from: data)

        if let dict = movieResponse.dictionary {
          completion(.success(dict))
        }

      } catch {
        completion(.failure(ServiceError(type: .invalid)))
      }
    }
  }

  
  /// Detail of Movie
   /// - Parameters:
   ///   - Parameter id: Movie id
   ///   - Parameter language (optional): Choose language based on region, ex: `en-us`
   ///   - Parameter completion: Movie response contains success and failed (error)
   open func detailOfMovie(withID id: Int, language: String = "en-US", completion: @escaping CompletionHandler) {
     let param: [String: String] = ["language": language]
     let path = MoviePath.detail(movieID: id).path

     ServiceManager.api.load(urlPath: path, queryItems: param, method: .GET, body: nil) { (data, error) in
       if let error = error {
         completion(.failure(error))
         return
       }

       guard let data = data else { return }

       let decoder = JSONDecoder()
       decoder.keyDecodingStrategy = .convertFromSnakeCase

       do {
         let movieDetailResponse = try decoder.decode(MovieDetailResponse.self, from: data)
         if let dict = movieDetailResponse.dictionary {
           completion(.success(dict))
         }
       } catch {
         completion(.failure(ServiceError(type: .invalid)))
       }
     }
   }

  
  /// Movie trailer
  /// - Parameter id: Movie id
  /// - Parameter language (optional): Choose language based on region, ex: `en-us`
  /// - Parameter completion: Movie response contains success and failed (error)
  open func videoOfMovie(withID id: Int, language: String = "en-US", completion: @escaping CompletionHandler) {
    let param: [String: String] = ["language": language]
    let path = MoviePath.video(movieID: id).path

    ServiceManager.api.load(urlPath: path, queryItems: param, method: .GET, body: nil) { (data, error) in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data else { return }

      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      do {
        let movieVideo = try decoder.decode(MovieVideoResponse.self, from: data)
        if let dict = movieVideo.dictionary {
          completion(.success(dict))
        }
      } catch {
        completion(.failure(ServiceError(type: .invalid)))
      }
      
    }
  }

  
  /// Search Movie by Keyword
  /// - Parameter keyword: Movie keyword to search
  /// - Parameter page (optional): Movie list of page, by default page is `1`
  /// - Parameter language (optional): Movie language description, by default language is `en-US`
  /// - Parameter completion: Movie response contains success and failed (error)
  open func searchOfMovie(keyword: String, page: String = "1",
                          language: String = "en-US", completion: @escaping CompletionHandler) {
    let param: [String: String] = ["query": keyword, "page": page, "language": language]
    let path = SearchPath.search.path

    ServiceManager.api.load(urlPath: path, queryItems: param, method: .GET, body: nil) { (data, error) in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data else { return }

      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      do {
        let movieResponse = try decoder.decode(MoviesResponse.self, from: data)
        if let dict = movieResponse.dictionary {
          completion(.success(dict))
        }
      } catch {
        completion(.failure(ServiceError(type: .invalid)))
      }

    }
  }
}
