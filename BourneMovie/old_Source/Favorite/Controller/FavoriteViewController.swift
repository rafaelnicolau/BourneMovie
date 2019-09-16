//
//  FavoriteViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 08/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit
import Kingfisher

class FavoriteViewController: UIViewController {

    
    @IBOutlet weak var tbFavorite: UITableView!
    @IBOutlet weak var lbText: UILabel!
    
    private let favoritePresenter = FavoritePresenter()
    private var movieViewData = [MovieViewData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favoritePresenter.setDelegate(favoriteDelegate: self)
        self.favoritePresenter.loadFavorite()
        let nib = UINib.init(nibName: "FavoriteTableViewCell", bundle: nil)
        self.tbFavorite.register(nib, forCellReuseIdentifier: "favoriteCell")
        self.tbFavorite.backgroundColor = .clear
        showTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.favoritePresenter.loadFavorite()
        showTableView()
    }
    
    func showTableView(){
        if self.movieViewData.isEmpty || self.movieViewData.count == 0{
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
        
        return self.movieViewData.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movieViewData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteTableViewCell
        cell.formatCell(movie)
        cell.movie = movie
        cell.delegate = self
        return cell
    }
}

extension FavoriteViewController: FavoriteDelegate{
    func removeFavorite(_ movie: MovieViewData) {
         self.movieViewData = self.movieViewData.filter(){($0.id != movie.id )}
        self.favoritePresenter.removeFavorite(movie)
        self.tbFavorite.reloadData()
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
        //
    }
    
    func setViewData(_ viewData: [MovieViewData]) {
        self.movieViewData = viewData
    }
    
    func setMovie(_ movie: MovieViewData) {
        //
    }
    
    func tableViewReload() {
        self.showTableView()
        self.tbFavorite.reloadData()
    }
    
    
}
