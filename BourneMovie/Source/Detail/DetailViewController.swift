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
    
    var id: Int?
    var indepath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColorBackButton()
        

        // Do any additional setup after loading the view.
    }
    
    func changeColorBackButton(){
        let templateImage = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        self.btBack.setImage(templateImage, for: .normal)
        self.btBack.tintColor = UIColor.red
    }
    
    
    
    func formatDetail(){
        DispatchQueue.main.async {
            for movie in 0..<Service.shared.result!.count {
                if Service.shared.result![movie].id == self.id {
                    if let genre = Service.shared.result![movie].genre_ids?.first {
                        self.lbPopularity.text = self.localizeGenres(genre)
                    }
                    self.lbTitle.text = Service.shared.result![movie].title
                    self.lbDescription.text = Service.shared.result![movie].overview
                    //                self.lbPopularity.text = "\(String(describing: Service.shared.result![movie].popularity))"
                    if let url = URL(string: Service.requestImage(image: Service.shared.result![movie].poster_path ?? "")) {
                        self.ivImage.kf.indicatorType = .activity
                        self.ivImage.kf.setImage(with: url)
                        if self.ivImage.image == nil {
                            self.ivImage.image = UIImage(named: "netflix")
                        }
                    }
                    break
                }
            }
        }
    
    }
    
    func localizeGenres(_ id: Int) -> String {
        guard let genres = Service.shared.genres else { return "" }
        var name = ""
        for i in 0..<genres.count {
            if genres[i].id == id {
                name = genres[i].name!
                break
            }
        }
        return name
    }

    @IBAction func btBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
