//
//  ErrorViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 04/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class CustomPopup: UIViewController {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbError: UILabel!
    @IBOutlet weak var btBack: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func btBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
