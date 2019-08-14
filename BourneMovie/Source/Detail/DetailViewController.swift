//
//  DetailViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 02/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbPopularity: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var btFavorite: UIButton!
    
    var movie: MovieViewData?

    var favorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validadeFavorite()
        formatBar()
        validadeDetail()
        formatDetail()
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
    
    func validadeDetail(){
        if self.movie == nil{
            self.ivImage.isHidden = true
            self.lbCategory.isHidden = true
            self.lbPopularity.isHidden = true
            self.lbDescription.isHidden = true
            self.btFavorite.isHidden = true
            let vc = CustomPopup()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    
//    func parseDetail(){
//        for movie in 0..<Service.shared.result.count{
//            if Service.shared.result[movie].id == self.id {
//                self.movie.title = Service.shared.result[movie].title
//                self.movie.overview = Service.shared.result[movie].overview
//                self.movie.poster_path = Service.shared.result[movie].poster_path
//                self.movie.popularity = Service.shared.result[movie].popularity
//                self.movie.genre_ids = Service.shared.result[movie].genre_ids
//                self.movie.vote_average = Service.shared.result[movie].vote_average
//                self.movie.backdrop_path = Service.shared.result[movie].backdrop_path
//                self.movie.favorite = false
//                break
//            }
//        }
//    }
    
    
    func formatDetail(){
        guard let movie = self.movie else { return }
        guard let genre = movie.genero.first else { return }
        localizeGenres(genre)
        if movie.descricao == ""{
            self.lbDescription.text = "Filme sem Descrição..."
        } else {
           self.lbDescription.text = "\(movie.descricao) Rate: \(movie.rate)"
        }
        self.lbPopularity.text = "Votos: \(movie.votos)"
        
        if let url = URL(string: Service.requestImage(image: movie.poster)) {
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
    
    func localizeGenres(_ id: Int) {
        guard let genres = Service.shared.requestGenres?.genres else { return }
        for i in 0..<genres.count {
            if genres[i].id == id {
                self.lbCategory.text = "Genero: \(genres[i].name!)"
                break
            }
        }
        
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

    @IBAction func btFavorite(_ sender: Any) {
        setFavorite()
    }
    

}
