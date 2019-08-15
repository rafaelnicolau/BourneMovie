//
//  MovieViewData.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 13/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation

struct MovieViewData {
    let id: Int
    let nomeFilme: String
    let rate: String
    let dataLancamento: String
    let genero: [Int]
    let descricao: String
    let poster: String
    let backPoster: String
    let votos: String
    var favorite: Bool
}

//MARK - Domain Mapper -
extension MovieViewData {
    init(movieResult: MovieResult) {
        self.id = movieResult.id ?? 0
        self.nomeFilme = movieResult.title ?? ""
        self.descricao = movieResult.overview ?? ""
        self.backPoster = movieResult.backdrop_path ?? ""
        self.poster = movieResult.poster_path ?? ""
        self.genero = movieResult.genre_ids ?? []
        self.dataLancamento = movieResult.release_date ?? ""
        self.rate = String(movieResult.vote_average ?? 0.0)
        self.votos = String(movieResult.popularity ?? 0.0)
        self.favorite = false
    }
}
