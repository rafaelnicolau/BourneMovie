//
//  FavoriteViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 08/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    
    @IBOutlet weak var tbFavorite: UITableView!
    @IBOutlet weak var lbText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "FavoriteTableViewCell", bundle: nil)
        self.tbFavorite.register(nib, forCellReuseIdentifier: "favoriteCell")
        self.tbFavorite.backgroundColor = .clear
        showTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showTableView()
    }
    
    func showTableView(){
        if Service.shared.favorite.listFavorite.isEmpty || Service.shared.favorite.listFavorite.count == 0{
            self.tbFavorite.isHidden = true
            self.lbText.isHidden = false
            self.lbText.text = "Nenhum filme no Favoritos..."
            self.tbFavorite.reloadData()
        }else {
            self.tbFavorite.isHidden = false
            self.lbText.isHidden = true
            self.tbFavorite.reloadData()
        }
    }
  

}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Service.shared.favorite.listFavorite.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = Service.shared.favorite.listFavorite[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteTableViewCell
        cell.formatCell(movie)
        return cell
    }
    
    
}
