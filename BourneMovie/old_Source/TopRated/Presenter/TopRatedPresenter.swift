//
//  TopRatedPresenter.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 26/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation

protocol TopRatedDelegate: NSObjectProtocol {
    func showLoading()
    func stopLoading()
    func emptyList()
    func gernicError()
    
}

class TopRatedPresenter {
    
    var currentPage: Int?
    var totalPage: Int?
    var loadTopMovies = false
    weak private var topratedDelegate: TopRatedDelegate?
    
    func setDelegate(topratedDelegate: TopRatedDelegate) {
        self.topratedDelegate = topratedDelegate
    }
}
