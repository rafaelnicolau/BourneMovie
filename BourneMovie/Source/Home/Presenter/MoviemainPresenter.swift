//
//  MoviemainPresenter.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 09/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import Foundation


class MoviemainPresenter {
    
    private var currentPage: Int?
    private var totalPages: Int?
    var movieViewData: [MovieViewData]?
    weak private var moviemainViewDelegate: MoviemainViewDelegate?
//    private let service: Service
    
//    init(service: Service) {
//        self.service = service
//    }
    
    func setDelegate(moviemainViewDelegate: MoviemainViewDelegate){
        self.moviemainViewDelegate = moviemainViewDelegate
    }

    //MARK POPUPERROR
    func popUpError(){
        let vc = CustomPopup()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
//        present(vc, animated: true, completion: nil)
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
        MovieAPI.loadMovies(numberPage: currentPage, onComplete: { [weak self] (movie) in
            Service.shared.serviceRequest = movie
            self?.currentPage = Service.shared.serviceRequest?.page
            self?.totalPages = Service.shared.serviceRequest?.total_pages
            guard let result = movie?.results else { return }
            Service.shared.result += result
            let viewData = Service.shared.result.map({ (movie) -> MovieViewData? in
                return MovieViewData(movieResult: movie)
            })
            print(viewData)
            //Service.shared.result > MovieViewData
            
           
            
            
        }) { (error) in
        
        }
    
    }
    
}


