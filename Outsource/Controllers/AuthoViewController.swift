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
        let layer = CAGradientLayer()
        layer.frame = graidentBG.layer.frame
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = [
            UIColor.gray.cgColor,UIColor.cyan.cgColor]
        graidentBG.layer.insertSublayer(layer, at: 0)
    }

    @IBAction func didLogin(_ sender: UIButton) {
        guard let email = emailField.text, let password = passwordField.text else {
            return
        }
        Firebase.Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error)
            } else {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }
    }
    
}

