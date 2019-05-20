//
//  SettingsViewController.swift
//  Outsource
//
//  Created by APPLE on 5/20/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rolePicker: UIPickerView!
    
    let user = Firebase.Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSubmit(_ sender: UIButton) {
        let changeRequest = user?.createProfileChangeRequest()
        changeRequest?.displayName = usernameField.text
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
