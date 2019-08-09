//
//  FavoriteTableViewCell.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 08/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit
import Kingfisher

protocol FavoriteCellDelegate: NSObjectProtocol {
    func tableViewReload()
}

class FavoriteTableViewCell: UITableViewCell {

    
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbScoreRank: UILabel!
    @IBOutlet weak var btFavorite: UIButton!
    
    var movie = Movie()
    var delegate: FavoriteCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func formatCell(_ movie: Movie) {
        self.lbTitle.text = movie.title
        if let rate = movie.vote_average, let popularity = movie.popularity {
            self.lbScoreRank.text = "Votos: \(popularity), Rate: \(rate)"
        }
        if let url = URL(string: Service.requestImage(image: movie.poster_path ?? "")) {
            uiImage.kf.indicatorType = .activity
            uiImage.kf.setImage(with: url)
            if uiImage.image == nil {
                uiImage.image = UIImage(named: "tron")
            }
        }
    }
    
    func removeFavorite(){
        Service.shared.favorite.listFavorite = Service.shared.favorite.listFavorite.filter(){($0.title != movie.title )}
        self.delegate?.tableViewReload()
        
    }
    
    @IBAction func btFavorite(_ sender: Any) {
        removeFavorite()
    }
    
    
}
