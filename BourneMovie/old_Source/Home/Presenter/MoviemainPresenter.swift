//
//  MoviemainPresenter.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 09/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation

protocol MoviemainViewDelegate: NSObjectProtocol{
    func showLoading()
    func stopLoading()
    func emptyList()
    func gernicError()
    //func setMovieVideoInfo(_ movie: MovieVideoInfo)
    func setViewData(_ viewData: [MovieViewData])
}

class MoviemainPresenter {
    
    var currentPage: Int?
    var totalPages: Int?
    var loadingMovie = false
    private var movieViewData = [MovieViewData]()
    private var movieVideoInfo: MovieVideoInfo?
    weak private var moviemainViewDelegate: MoviemainViewDelegate?
    
    func setDelegate(moviemainViewDelegate: MoviemainViewDelegate){
        self.moviemainViewDelegate = moviemainViewDelegate
    }
    
    //MARK LOAD_SERVICES
    func loadGenres() {
        MovieAPI.loadGenre(onComplete: {(genres) in
            Service.shared.requestGenres = genres
        }) { (error) in
            print(error)
        }
    }
    
    func loadMovies(){
        loadingMovie = true
        MovieAPI.loadMovies(numberPage: currentPage, onComplete: { [weak self] (movie) in
            Service.shared.serviceRequest = movie
            self?.currentPage = Service.shared.serviceRequest?.page
            self?.totalPages = Service.shared.serviceRequest?.total_pages
            guard let result = movie?.results else { return }
            Service.shared.result += result
            self?.movieViewData = Service.shared.result.map({ (movie) -> MovieViewData in
                return MovieViewData(movieResult: movie)
            })
            DispatchQueue.main.async {
                self?.moviemainViewDelegate?.setViewData(self!.movieViewData)
                self?.loadingMovie = false
            }
        }) { (error) in
        self.moviemainViewDelegate?.gernicError()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0 , execute: { [weak self] in
            self?.moviemainViewDelegate?.gernicError()
            self?.loadMovies()
            })
        }
    
    }
    
}

