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
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var tbMovie: UITableView!
    @IBOutlet weak var tfLocalizer: UITextField!
    @IBOutlet weak var btSearch: UIButton!
    
    
    private var nameFilme: String?
    private var idMovie: Int?
    private var indexpath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColorSearchButton()
        self.indicator.isHidden = false
        self.tbMovie.isHidden = true
        loadGenres()
        loadMovie()
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMovie()
        self.tbMovie.reloadData()
    }

    func changeColorSearchButton(){
        let searchImage = UIImage(named: "loupe")?.withRenderingMode(.alwaysTemplate)
        self.btSearch.setImage(searchImage, for: .normal)
        self.btSearch.tintColor = UIColor.orange
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
    
    @IBAction func btSearch(_ sender: Any) {
        guard let search = tfLocalizer.text else { return }
        if Service.shared.result.contains(where: { $0.title == search}) {
            for i in 0..<Service.shared.result.count {
                if Service.shared.result[i].title == search {
                    Service.shared.result = [Service.shared.result[i]]
                    self.tbMovie.reloadData()
                    self.tfLocalizer.text = ""
                    break
                }
            }
        }else {
            let vc = CustomPopupViewController()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    
    func alerta(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default ))
        self.present(alert, animated: true, completion: nil)
    }
    
}



extension MoviemainController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return Service.shared.result.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tbMovie.dequeueReusableCell(withIdentifier: "cellMovie") as! MoviemainTableViewCell
        cell.formatCell(Service.shared.result[indexPath.row])
        cell.delegate = self
        cell.result = Service.shared.result[indexPath.row]
        cell.id = Service.shared.result[indexPath.row].id
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
