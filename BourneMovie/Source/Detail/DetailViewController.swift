//
//  DetailViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 02/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var btBack: UIButton!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbPopularity: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var btFavorite: UIButton!
    
    private var detail = Detail()
    var id: Int?
    var indepath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColorBackButton()
        parseDetail()
        formatDetail()
        

        // Do any additional setup after loading the view.
    }
    
    func changeColorBackButton(){
        let templateImage = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        self.btBack.setImage(templateImage, for: .normal)
        self.btBack.tintColor = UIColor.red
    }
    
    func parseDetail(){
        for movie in 0..<Service.shared.result.count{
            if Service.shared.result[movie].id == self.id {
                self.detail.title = Service.shared.result[movie].title
                self.detail.information = Service.shared.result[movie].overview
                self.detail.poster = Service.shared.result[movie].poster_path
                self.detail.popularity = Service.shared.result[movie].popularity
                self.detail.genre = Service.shared.result[movie].genre_ids
                self.detail.favorite = false
                break
            }
        }
    }
    
    
    func formatDetail(){
        guard let genre = detail.genre?.first else { return }
        self.lbTitle.text = detail.title
        self.lbDescription.text = detail.information
        self.lbPopularity.text = "\(String(describing: detail.popularity))"
        localizeGenres(genre)
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
                self.lbCategory.text = genres[i].name
                break
            }
        }
        
    }

    @IBAction func btBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func btFavorite(_ sender: Any) {
    }
    

}
