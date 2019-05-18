//
//  SignUpViewController.swift
//  Outsource
//
//  Created by APPLE on 5/18/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var rolePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSignUp(_ sender: UIButton) {
        //let db = Firestore.firestore()
        guard let email = emailField.text, let password = passwordField.text else {
            return
        }
        Firebase.Auth.auth().createUser(withEmail: email, password: password, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
