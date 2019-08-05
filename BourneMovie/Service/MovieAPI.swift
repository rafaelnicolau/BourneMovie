//
//  MovieAPI.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 14/06/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation
import Alamofire

enum MovieError{
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

enum GenresError{
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class MovieAPI {
    
    private static let basePath = "https://api.themoviedb.org/3/movie/popular?api_key=69d50a611a8bb715594ccee31cb6623f&languege=pt-BR&"
    private static let genresPath = "https://api.themoviedb.org/3/genre/movie/list?api_key=69d50a611a8bb715594ccee31cb6623f&languege=pt-BR&"
    private static let configuration: URLSessionConfiguration = {
       let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    private static let session = URLSession(configuration: configuration)
    
    
    class func loadMovies(onComplete: @escaping (MovieInfo) -> Void, onError: @escaping (MovieError) -> Void) {
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do{
                        let movies = try JSONDecoder().decode(MovieInfo.self, from: data)
                        onComplete(movies)
                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                }else {
                    onError(.responseStatusCode(code: response.statusCode))
                }
            }else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
    
    class func loadGenre(onComplete: @escaping (Genres) -> Void, onError: @escaping (GenresError) -> Void) {
        guard let url = URL(string: genresPath) else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do{
                        let genres = try JSONDecoder().decode(Genres.self, from: data)
                        onComplete(genres)
                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                }else {
                    onError(.responseStatusCode(code: response.statusCode))
                }
            }else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
    
    
}
