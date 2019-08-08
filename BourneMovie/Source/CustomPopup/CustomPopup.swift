//
//  CustomPopupViewController.swift
//  BourneMovie
//
//  Created by Rafael Ignacio da Silva Nicolau on 05/08/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class CustomPopup: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    @IBAction func btBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
