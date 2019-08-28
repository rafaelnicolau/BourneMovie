//
//  MovieClass.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 14/06/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation


class MovieInfo: Codable {
    var page : Int?
    var total_result: Int?
    var total_pages: Int?
    var results: [MovieResult]?
}

class MovieResult: Codable {
    var vote_count: Int?
    var id: Int?
    var video: Bool?
    var vote_average: Double?
    var title: String?
    var popularity: Double?
    var poster_path: String?
    var original_language: String?
    var original_title: String?
    var genre_ids: [Int]?
    var backdrop_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
}

class MovieGenres: Codable{
    var genres: [Genres]?
}

class MovieVideoInfo: Codable {
    var id: Int?
    var results: [MovieVideoResult]?
}

class MovieVideoResult: Codable {
    var id: String?
    var iso_639_1: String?
    var iso_3166_1: String?
    var key: String?
    var name: String?
    var site: String?
    var size: Int?
    var type: String?
}

class MovieTopRated: Codable {
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [ResultTopRated]?
}

class ResultTopRated: Codable {
    var poster_path: String?
    var adult: Bool?
    var overview: String?
    var gende_ids: [Int]?
    var id: Int?
    var original_title: String?
    var original_language: String?
    var title: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_count: Int?
    var video: Bool?
    var vote_average: Double?
}
