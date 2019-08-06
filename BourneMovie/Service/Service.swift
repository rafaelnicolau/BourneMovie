//
//  Service.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 30/07/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation



class Service {
    
    static var shared = Service()
    
    private init () {}
    
    var serviceRequest: MovieInfo?
    var requestGenres: MovieGenres?
    var result = [MovieResult]()
    
    var detail: Detail?
    
    
    class func requestImage(image: String) -> String {
        let basePath = "https://image.tmdb.org/t/p/w500/"
        return basePath + image
        }
    
//    func requestGenre(_ id: Int) -> String {
//
//        for i in 0..<genres.genres?.count {
//            if genres[i] == id {
//                genero = genres[i].name!
//            }
//        }
//        return genero
//    }
}
