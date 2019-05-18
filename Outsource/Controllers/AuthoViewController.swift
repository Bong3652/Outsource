//
//  ViewController.swift
//  Outsource
//
//  Created by APPLE on 5/18/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import UIKit
import Firebase

class AuthoViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var graidentBG: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didLogin(_ sender: UIButton) {
    }
    
}

