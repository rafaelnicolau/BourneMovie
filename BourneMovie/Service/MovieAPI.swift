//
//  MovieAPI.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 14/06/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation
import Alamofire

enum GenericError{
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class MovieAPI {
    
    private static let basePath = "https://api.themoviedb.org/3/movie/popular?api_key=69d50a611a8bb715594ccee31cb6623f&language=pt-BR&"
    private static let genresPath = "https://api.themoviedb.org/3/genre/movie/list?api_key=69d50a611a8bb715594ccee31cb6623f&language=pt-BR&"
    private static let videoPath = "https://api.themoviedb.org/3/movie/"
    private static let topRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=69d50a611a8bb715594ccee31cb6623f&language=pt-BR&"
    
    private static let configuration: URLSessionConfiguration = {
       let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    private static let session = URLSession(configuration: configuration)
    
    
    class func loadMovies(numberPage: Int? , onComplete: @escaping (MovieInfo?) -> Void, onError: @escaping (GenericError) -> Void) {
        guard let url = URL(string: (basePath + "page=\(numberPage ?? 1)")) else {
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
    
    
    class func loadGenre(onComplete: @escaping (MovieGenres) -> Void, onError: @escaping (GenericError) -> Void) {
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
                        let genres = try JSONDecoder().decode(MovieGenres.self, from: data)
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
    
    class func loadVideo(MovieId: Int, onComplete: @escaping (MovieVideoInfo) -> Void, onError: @escaping (GenericError) -> Void) {
        let apiKey = "/videos?api_key=69d50a611a8bb715594ccee31cb6623f&language=pt-BR&"
        guard let url = URL(string: videoPath + "\(MovieId)" + apiKey) else {
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
                        let movie = try JSONDecoder().decode(MovieVideoInfo.self, from: data)
                        onComplete(movie)
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
    
    class func loadTopRated(numberPage: Int?, onComplete: @escaping (MovieTopRated?) -> Void, onError: @escaping(GenericError) -> Void){
        guard let url = URL(string: (topRated + "page=\(numberPage ?? 1)")) else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let movieTopRated = try JSONDecoder().decode(MovieTopRated.self, from: data)
                        onComplete(movieTopRated)
                    }catch{
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                }else{
                    onError(.responseStatusCode(code: response.statusCode))
                }
            }else{
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
    
    
}
