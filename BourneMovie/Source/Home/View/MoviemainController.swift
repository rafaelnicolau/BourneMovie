//
//  ViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 13/06/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

protocol MoviemainViewDelegate: NSObjectProtocol{
    func getMovieService(movieInfo: MovieInfo?, movieResult: MovieResult?)
    func movieDidLoaded(movieData: [MovieViewData])
    func hideLoading()
    func showLoading()
    func reloadMovies()
}

class MoviemainController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var SecondView: UIView!
    @IBOutlet weak var tbMovie: UITableView!
    
    private let moviemainPresenter = MoviemainPresenter()
    
    private var idMovie: Int?
    private var indexpath: IndexPath?
    let searchController = UISearchController(searchResultsController: nil)
    var filterMovies = [MovieResult]()
    private var currentPage: Int?
    private var totalPages: Int?
    var loadingMovie = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviemainPresenter.setDelegate(moviemainViewDelegate: self)
        moviemainPresenter.loadGenres()
        moviemainPresenter.loadMovies()
        setupNavBar()
        self.indicator.isHidden = false
        self.tbMovie.isHidden = true
//        loadGenres()
//        showServiceTableView()
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
        filterMovies = Service.shared.result.filter{ movie in
            return (movie.title?.lowercased().contains(searchText.lowercased()))!
            }
            self.tbMovie.reloadData()
    }
   
    
    func showServiceTableView() {
        self.loadingMovie = true
        MovieAPI.loadMovies(numberPage: currentPage, onComplete: { [weak self] (movie) in
            Service.shared.serviceRequest = movie
            self?.currentPage = Service.shared.serviceRequest?.page
            self?.totalPages = Service.shared.serviceRequest?.total_pages
            guard let result = movie?.results else { return }
            Service.shared.result += result
            DispatchQueue.main.async {
                self?.tbMovie.reloadData()
                self?.tbMovie.isHidden = false
                self?.loadingMovie = false
            }
        }) { (error) in
            self.tbMovie.isHidden = true
            self.indicator.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                self.popupError()
                self.showServiceTableView()
            }
        )}
    }
    
    func popupError(){
        let vc = CustomPopup()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == Service.shared.result.count - 5 && Service.shared.result.count != totalPages && !loadingMovie {
            if let page = currentPage {
                self.currentPage = page + 1
                self.showServiceTableView()
            }
            
        }
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

}

extension MoviemainController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

extension MoviemainController: MoviemainViewDelegate {
    func movieDidLoaded(movieData: [MovieViewData]) {
        //
    }
    
    func hideLoading() {
        //
    }
    
    func showLoading() {
        //
    }
    
    func reloadMovies() {
        //
    }
    
    func getMovieService(movieInfo: MovieInfo?, movieResult: MovieResult?) {
        self.tbMovie.reloadData()
    }
    
    
}
