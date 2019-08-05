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
