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
    
    private var movie = Movie()
    var id: Int?
    var indepath: IndexPath?
    var favorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatBar()
        validadeDetail()
        formatDetail()
        

        // Do any additional setup after loading the view.
    }
    
   
    
    func formatBar(){
        let nav = self.navigationController?.navigationBar
        self.title = movie.title
        navigationItem.largeTitleDisplayMode = .never
        nav?.tintColor = UIColor.orange
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange]
    }
    
//    func formatFavoriteIcon(){
//        let ImageIsEmpty = UIImage(named: "favoriteIsEmpty")
//    }
    
    func validadeDetail(){
        if self.id == nil{
            self.ivImage.isHidden = true
            self.lbCategory.isHidden = true
            self.lbPopularity.isHidden = true
            self.lbDescription.isHidden = true
            self.btFavorite.isHidden = true
            let vc = CustomPopup()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }else {
            parseDetail()
        }
    }
    
    
    
    func parseDetail(){
        for movie in 0..<Service.shared.result.count{
            if Service.shared.result[movie].id == self.id {
                self.movie.title = Service.shared.result[movie].title
                self.movie.overview = Service.shared.result[movie].overview
                self.movie.poster_path = Service.shared.result[movie].poster_path
                self.movie.popularity = Service.shared.result[movie].popularity
                self.movie.genre_ids = Service.shared.result[movie].genre_ids
                self.movie.vote_average = Service.shared.result[movie].vote_average
                self.movie.backdrop_path = Service.shared.result[movie].backdrop_path
                self.movie.favorite = false
                break
            }
        }
    }
    
    
    func formatDetail(){
        guard let genre = movie.genre_ids?.first else { return }
        localizeGenres(genre)
        self.lbDescription.text = "\(movie.overview!) Rank: \(movie.vote_average!)"
        self.lbPopularity.text = "Votos: \(movie.popularity!)"
        
        if let url = URL(string: Service.requestImage(image: movie.poster_path ?? "")) {
            self.ivImage.kf.indicatorType = .activity
            self.ivImage.kf.setImage(with: url)
            if self.ivImage.image == nil {
                self.ivImage.image = UIImage(named: "tron")
        }
    }
        if let url = URL(string: Service.requestImage(image: movie.backdrop_path ?? "")){
            self.backImage.kf.indicatorType = .activity
            self.backImage.kf.setImage(with: url)
            if self.backImage.image == nil {
                self.backImage.image = UIImage(named: "tron")
            }
//            self.backImage.alpha = 0.3
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
    func findFavoriteAndRemove(_ movie: Movie){
        Service.shared.favorite.listFavorite = Service.shared.favorite.listFavorite.filter(){($0.title != movie.title )}
    }
    
    func setFavorite(){
        if !favorite {
            let image = UIImage(named: "favoriteFull")
            let newImage = image?.withRenderingMode(.alwaysTemplate)
            self.btFavorite.setImage(newImage, for: .normal)
            self.btFavorite.tintColor = .orange
            Service.shared.favorite.listFavorite.append(movie)
            self.favorite = true
            
        }else{
            let image = UIImage(named: "favoriteIsEmpty")
            let newImage = image?.withRenderingMode(.alwaysTemplate)
            self.btFavorite.setImage(newImage, for: .normal)
            self.btFavorite.tintColor = .orange
            findFavoriteAndRemove(movie)
            self.favorite = false
        }
    }

    @IBAction func btFavorite(_ sender: Any) {
        setFavorite()
    }
    

}
