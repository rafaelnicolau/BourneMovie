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
    
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbPopularity: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var btFavorite: UIButton!
    
    private var detail = Detail()
    var id: Int?
    var indepath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatBar()
        validadeDetail()
        formatDetail()
        

        // Do any additional setup after loading the view.
    }
    
   
    
    func formatBar(){
        let nav = self.navigationController?.navigationBar
        self.title = detail.title
        navigationItem.largeTitleDisplayMode = .never
        nav?.tintColor = UIColor.orange
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange]
    }
    
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
                self.detail.title = Service.shared.result[movie].title
                self.detail.information = Service.shared.result[movie].overview
                self.detail.poster = Service.shared.result[movie].poster_path
                self.detail.popularity = Service.shared.result[movie].popularity
                self.detail.genre = Service.shared.result[movie].genre_ids
                self.detail.rank = Service.shared.result[movie].vote_average
                self.detail.favorite = false
                break
            }
        }
    }
    
    
    func formatDetail(){
        guard let genre = detail.genre?.first else { return }
        localizeGenres(genre)
        self.lbDescription.text = "\(detail.information!) Rank: \(detail.rank!)"
        self.lbPopularity.text = "Votos: \(detail.popularity!)"
        
        if let url = URL(string: Service.requestImage(image: detail.poster ?? "")) {
            self.ivImage.kf.indicatorType = .activity
            self.ivImage.kf.setImage(with: url)
            if self.ivImage.image == nil {
                self.ivImage.image = UIImage(named: "tron")
        
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

    @IBAction func btFavorite(_ sender: Any) {
    }
    

}
