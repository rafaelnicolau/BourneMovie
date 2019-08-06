//
//  ViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 13/06/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class MoviemainController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var SecondView: UIView!
    @IBOutlet weak var tbMovie: UITableView!
    
    
    private var idMovie: Int?
    private var indexpath: IndexPath?
    let searchController = UISearchController(searchResultsController: nil)
    var filterMovies = [MovieResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        self.indicator.isHidden = false
        self.tbMovie.isHidden = true
        loadGenres()
        loadMovie()
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tbMovie.reloadData()
    }
    
    func setupNavBar() {
        let nav = navigationController
        nav?.navigationBar.tintColor = .orange
        nav?.navigationBar.tintColor = UIColor.orange
        nav?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange]
        nav?.navigationBar.prefersLargeTitles = true
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    func filterContentForSearchText(searchText: String) {
        filterMovies = Service.shared.result.filter{ movie in
            return (movie.title?.lowercased().contains(searchText.lowercased()))!
            }
            self.tbMovie.reloadData()
    }
   
    
    func loadMovie() {
        MovieAPI.loadMovies(onComplete: { [weak self] (movie) in
            Service.shared.serviceRequest = movie
            guard let result = movie.results else { return }
            Service.shared.result = result
            DispatchQueue.main.async {
                self?.tbMovie.reloadData()
                self?.tbMovie.isHidden = false
                
            }
        }) { (error) in
            self.tbMovie.isHidden = true
            self.indicator.isHidden = false
            print(error)
        }
    }
    
    func loadGenres() {
        MovieAPI.loadGenre(onComplete: {(genres) in
            Service.shared.requestGenres = genres
        }) { (error) in
            print(error)
        }
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        vc.id = self.idMovie
        vc.indepath = self.indexpath
    }
    
    func sortedImage(){
        
    }
    
    func search(_ title: String) {
        
    }
    
//    @IBAction func btSearch(_ sender: Any) {
//        guard let search = tfLocalizer.text else { return }
//        if Service.shared.result.contains(where: { $0.title == search}) {
//            for i in 0..<Service.shared.result.count {
//                if Service.shared.result[i].title == search {
//                    Service.shared.result = [Service.shared.result[i]]
//                    self.tbMovie.reloadData()
//                    self.tfLocalizer.text = ""
//                    break
//                }
//            }
//        }else {
//            let vc = CustomPopupViewController()
//            vc.modalTransitionStyle = .crossDissolve
//            vc.modalPresentationStyle = .overCurrentContext
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
    
    
    
    func alerta(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default ))
        self.present(alert, animated: true, completion: nil)
    }
    
}



extension MoviemainController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if searchController.isActive && searchController.searchBar.text != ""{
        return self.filterMovies.count
        }
        
        return Service.shared.result.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie: MovieResult
        if searchController.isActive && searchController.searchBar.text != ""{
            movie = self.filterMovies[indexPath.row]
        }else {
            movie = Service.shared.result[indexPath.row]
        }
        
        let cell = self.tbMovie.dequeueReusableCell(withIdentifier: "cellMovie") as! MoviemainTableViewCell
        cell.formatCell(movie)
        cell.delegate = self
        cell.result = movie
        cell.id = movie.id
        cell.indexpath = indexPath
        return cell
    }

}

extension MoviemainController: MoviemainDelegate {
    func object(id: Int, indexPath: IndexPath) {
        self.idMovie = id
        self.indexpath = indexPath
    }
    
    func tableviewReload() {
        self.tbMovie.reloadData()
    }
    
    
}

extension MoviemainController: UISearchBarDelegate {



//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
////        searchBar.text
//    }
}

extension MoviemainController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    
}
