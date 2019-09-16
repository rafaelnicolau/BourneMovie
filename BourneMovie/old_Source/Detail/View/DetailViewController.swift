//
//  DetailViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 02/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit
import Kingfisher
import AVKit

class DetailViewController: UIViewController, AVPlayerViewControllerDelegate {

    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbPopularity: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var btFavorite: UIButton!
    @IBOutlet weak var btVideo: UIButton!
    
    var movie: MovieViewData?
    private var movieVideo = MovieVideoInfo()
//    var favorite = false
    private var detailPresenter = DetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatBar()
        detailPresenter.setDelegate(detailDelegate: self)
        detailPresenter.movieViewData = self.movie
        detailPresenter.loadMovieInfo()
        validadeFavorite()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        validadeFavorite()
    }
   
    
    func formatBar(){
        let nav = self.navigationController?.navigationBar
        self.title = movie?.nomeFilme
        navigationItem.largeTitleDisplayMode = .never
        nav?.tintColor = UIColor.orange
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange]
       self.tabBarController?.tabBar.isHidden = true
    }
    
    func findFavoriteAndRemove(_ movie: MovieViewData){
        Service.shared.favorite.listFavorite = Service.shared.favorite.listFavorite.filter(){($0.id != movie.id)}
    }
    
    func setFavorite(){
        guard let movie = movie else { return }
        if !movie.favorite {
            let image = UIImage(named: "favoriteFull")
            let newImage = image?.withRenderingMode(.alwaysTemplate)
            self.btFavorite.setImage(newImage, for: .normal)
            self.btFavorite.tintColor = .orange
            self.movie?.favorite = true
            Service.shared.favorite.listFavorite.append(self.movie!)
            
            
        }else{
            let image = UIImage(named: "favoriteIsEmpty")
            let newImage = image?.withRenderingMode(.alwaysTemplate)
            self.btFavorite.setImage(newImage, for: .normal)
            self.btFavorite.tintColor = .orange
            self.movie?.favorite = false
            findFavoriteAndRemove(movie)
        }
    }
    
    func validadeFavorite(){
        if Service.shared.favorite.listFavorite.contains(where: { ($0.id == movie?.id)}) {
         self.movie?.favorite = true
            self.btFavorite.setImage(UIImage(named: "favoriteFull"), for: .normal)
        }else {
            self.movie?.favorite = false
            self.btFavorite.setImage(UIImage(named: "favoriteIsEmpty"), for: .normal)
        }
    }
    
    func player(_ key: String){
    guard let  basePath = URL(string: "https://m.youtube.com/watch?v=\(key)") else { return }
        let vc = CustomTrailerViewController()
        vc.link = basePath
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func btFavorite(_ sender: Any) {
        setFavorite()
    }
    
    @IBAction func btVideo(_ sender: Any) {
    guard let movieResult = self.movie?.video?.results?.first else { return }
        guard let key = movieResult.key else { return }
    player(key)
        
    }
    
}

extension DetailViewController: DetailDelegate {
    func setGenre(_ genre: String) {
        self.lbCategory.text = "Categoria: \(genre)"
    }
    
    func showDetail() {
        guard let movie = self.movie else { return }
        self.detailPresenter.localizeGenres(movie.genero.first)
        self.btVideo.backgroundColor = .clear
        self.btVideo.layer.cornerRadius = 10
        self.btVideo.layer.borderWidth = 2
        self.btVideo.layer.borderColor = UIColor.orange.cgColor
        if let linkVideo = movie.video?.results?.first {
            self.btVideo.setTitle(linkVideo.site, for: .normal)
        }else {
            self.btVideo.isHidden = true
        }
        if movie.descricao == ""{
            self.lbDescription.text = "Filme sem Descrição..."
        }else {
            self.lbDescription.text = "\(movie.descricao) Rate: \(movie.rate)"
        }
        self.lbPopularity.text = "Votos: \(movie.votos)"
        if let url = URL(string: Service.requestImage(image: movie.poster)){
            self.ivImage.kf.indicatorType = .activity
            self.ivImage.kf.setImage(with: url)
            if self.ivImage.image == nil {
                self.ivImage.image = UIImage(named: "tron")
            }
        }
        if let url = URL(string: Service.requestImage(image: movie.backPoster)){
            self.backImage.kf.indicatorType = .activity
            self.backImage.kf.setImage(with: url)
            if self.backImage.image == nil {
                self.backImage.image = UIImage(named: "tron")
            }
        }
        
    }
    
    func showTableView() {
        //
    }
    
    func showLoading() {
        //
    }
    
    func stopLoading() {
        //
    }
    
    func emptyList() {
        //
    }
    
    func gernicError() {
        self.ivImage.isHidden = true
        self.lbCategory.isHidden = true
        self.lbPopularity.isHidden = true
        self.lbDescription.isHidden = true
        self.btFavorite.isHidden = true
        self.btVideo.isHidden = true
        let vc = CustomPopup()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    func setMovieVideoInfo(_ movie: MovieVideoInfo) {
        self.movie?.video = movie
    }
    
    func setViewData(_ viewData: [MovieViewData]) {
        //
    }
    
    func setMovie(_ movie: MovieViewData) {
        self.movie = movie
    }
}


