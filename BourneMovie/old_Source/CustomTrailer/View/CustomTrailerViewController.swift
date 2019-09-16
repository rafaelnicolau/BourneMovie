//
//  CustomTrailerViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 17/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class CustomTrailerViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var btBack: UIButton!
    
    var link: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showWebView(url: self.link)
        // Do any additional setup after loading the view.
    }
    
    func showWebView(url: URL?){
        guard let url = url else { return }
        self.webView.loadRequest(URLRequest(url: url))
        
    }

    @IBAction func btBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
