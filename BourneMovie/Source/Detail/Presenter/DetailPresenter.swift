//
//  DetailPresenter.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 19/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation

import Foundation

protocol DetailDelegate: NSObjectProtocol{
    func showDetail()
    func showLoading()
    func stopLoading()
    func setGenre(_ genre: String)
    func gernicError()
    func setMovieVideoInfo(_ movie: MovieVideoInfo)
    func setViewData(_ viewData: [MovieViewData])
    func setMovie(_ movie: MovieViewData)
}

class DetailPresenter {
    
    var movieViewData: MovieViewData?
    private var movieVideoInfo: MovieVideoInfo?
    weak private var detailDelegate: DetailDelegate?
    
    func setDelegate(detailDelegate: DetailDelegate){
        self.detailDelegate = detailDelegate
    }
    
    //MARK LOAD_SERVICES
    
    func loadMovieInfo(){
        guard let movie = self.movieViewData else { return }
        MovieAPI.loadVideo(MovieId: movie.id, onComplete: { (movieInfo) in
            self.movieVideoInfo = movieInfo
            DispatchQueue.main.async {
                self.movieVideoInfo = movieInfo
                self.movieViewData?.video = movieInfo
                self.detailDelegate?.setMovie(self.movieViewData!)
                self.detailDelegate?.showDetail()
            }
        }) { (error) in
            print(error)
            DispatchQueue.main.async {
                self.detailDelegate?.gernicError()
            }
        }
    }
    
    func formatDetail(){
        if let movie = self.movieViewData {
            self.detailDelegate?.showDetail()
        }else {
            self.detailDelegate?.gernicError()
        }
    }
    
    func localizeGenres(_ id: Int?) {
        guard let genres = Service.shared.requestGenres?.genres else { return }
        for i in 0..<genres.count {
            if genres[i].id == id {
                if let text = genres[i].name{
                  self.detailDelegate?.setGenre(text)
                }
                break
            }
        }
        
    }
    
    func requestImage(image: String) -> String {
        let basePath = "https://image.tmdb.org/t/p/w500/"
        return basePath + image
    }
}
