//
//  FavoriteTableViewCell.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 08/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit
import Kingfisher



class FavoriteTableViewCell: UITableViewCell {

    
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbScoreRank: UILabel!
    @IBOutlet weak var btFavorite: UIButton!
    
    var movie: MovieViewData?
    var delegate: FavoriteDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func formatCell(_ movie: MovieViewData) {
        self.lbTitle.text = movie.nomeFilme
        self.lbScoreRank.text = "Votos: \(movie.votos), Rate: \(movie.rate)"
        if let url = URL(string: Service.requestImage(image: movie.poster)) {
            uiImage.kf.indicatorType = .activity
            uiImage.kf.setImage(with: url)
            if uiImage.image == nil {
                uiImage.image = UIImage(named: "tron")
            }
        }
    }
    
    @IBAction func btFavorite(_ sender: Any) {
        guard let movie = movie else { return }
        delegate?.removeFavorite(movie)
    }
    
    
}
