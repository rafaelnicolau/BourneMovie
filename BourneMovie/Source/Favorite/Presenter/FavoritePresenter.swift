//
//  FavoritePresenter.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 15/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation

protocol FavoriteDelegate: NSObjectProtocol {
    func showTableView()
    func showLoading()
    func stopLoading()
    func emptyList()
    func gernicError()
    func setViewData(_ viewData: [MovieViewData])
    func setMovie(_ movie: MovieViewData)
    func tableViewReload()
    func removeFavorite(_ movie: MovieViewData)
}

class FavoritePresenter {
    
    private var movieViewData = [MovieViewData]()
    weak private var favoriteDelegate: FavoriteDelegate?
    
    func setDelegate(favoriteDelegate: FavoriteDelegate){
        self.favoriteDelegate = favoriteDelegate
    }
    
    func loadFavorite(){
        self.movieViewData = Service.shared.favorite.listFavorite
        self.favoriteDelegate?.setViewData(self.movieViewData)
        self.favoriteDelegate?.tableViewReload()
    }
    
    
    
}
