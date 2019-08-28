//
//  MoviemainTableViewCell.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 02/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit
import Kingfisher

class MoviemainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbRate: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var btDetail: UIButton!
    
    var movieVideoInfo: MovieVideoInfo?
    var showMovie: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func formatCell(_ movie: MovieViewData) {
        self.lbRate.text = "Rate: \(movie.rate)"
        self.lbNome.text = movie.nomeFilme
        self.btDetail.layer.cornerRadius = 10
        self.btDetail.layer.borderWidth = 2
        self.btDetail.layer.borderColor = UIColor.orange.cgColor
        self.btDetail.layer.backgroundColor = UIColor(named: "main")?.cgColor
        
        self.lbDate.text = "Lançamento: \(movie.dataLancamento)"
        if let url = URL(string: Service.requestImage(image: movie.poster)) {
            ivImage.kf.indicatorType = .activity
            ivImage.kf.setImage(with: url)
            if ivImage.image == nil {
                ivImage.image = UIImage(named: "tron")
            }
        }
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btDetail(_ sender: Any) {
        guard let showMovie = showMovie else { return }
        showMovie()
    }
    
}
