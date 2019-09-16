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
    
    private let moviemainPresenter = MoviemainPresenter()
    
    let searchController = UISearchController(searchResultsController: nil)
    private var filterMovies = [MovieViewData]()
    private var movieViewData = [MovieViewData]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviemainPresenter.setDelegate(moviemainViewDelegate: self)
        moviemainPresenter.loadGenres()
        moviemainPresenter.loadMovies()
        setupNavBar()
        self.indicator.isHidden = false
        self.tbMovie.isHidden = true
        }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar()
        self.tabBarController?.tabBar.isHidden = false
        self.tbMovie.reloadData()
    }
    
    func setupNavBar() {
        let nav = navigationController
        nav?.navigationBar.tintColor = .orange
        nav?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange]
        nav?.navigationBar.prefersLargeTitles = true
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.value(forKey: "searchField") as! UITextField
        self.searchController.searchBar.placeholder = "Search Title"
        self.searchController.searchBar.tintColor = .white
        self.searchController.searchBar.barStyle = .blackTranslucent
        navigationItem.searchController = searchController
    }
    
    func filterContentForSearchText(searchText: String) {
        filterMovies = movieViewData.filter({ movie in
            return (movie.nomeFilme.lowercased().contains(searchText.lowercased()))
        })
            self.tbMovie.reloadData()
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? DetailViewController,
                  segue.identifier == "detailSegue",
                  let index = sender as? Int
                  else { return }
        viewController.movie = self.movieViewData[index]
    }
    
}


extension MoviemainController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if searchController.isActive && searchController.searchBar.text != ""{
        return self.filterMovies.count
        }
        
        return movieViewData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie: MovieViewData
        if searchController.isActive && searchController.searchBar.text != ""{
            movie = self.filterMovies[indexPath.row]
        }else {
            movie = movieViewData[indexPath.row]
        }
        let cell = self.tbMovie.dequeueReusableCell(withIdentifier: "cellMovie") as! MoviemainTableViewCell
        cell.formatCell(movie)
        cell.showMovie = { [weak self] in
            self?.performSegue(withIdentifier: "detailSegue", sender: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movieViewData.count - 5 && movieViewData.count != moviemainPresenter.totalPages && !moviemainPresenter.loadingMovie {
            if let page = moviemainPresenter.currentPage {
                moviemainPresenter.currentPage = page + 1
                moviemainPresenter.loadMovies()
            }
        }
    }

}


extension MoviemainController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

extension MoviemainController: MoviemainViewDelegate {
    func stopLoading() {
        //
    }
    
    func emptyList() {
        //
    }
    
    func gernicError() {
        DispatchQueue.main.async {
            self.indicator.isHidden = false
            self.tbMovie.isHidden = true
            let vc = CustomPopup()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func setViewData(_ viewData: [MovieViewData]) {
        self.movieViewData = viewData
        self.tbMovie.isHidden = false
        self.tbMovie.reloadData()
    }
    
    func showLoading() {
        //
    }
}
