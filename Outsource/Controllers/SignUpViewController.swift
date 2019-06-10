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
    
    let roles = ["Developer", "UI Designer", "Testor"]
    lazy var selectedRole = roles[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rolePicker.delegate = self
        rolePicker.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSignUp(_ sender: UIButton) {
        let db = Firestore.firestore()
        guard let email = emailField.text, let password = passwordField.text else {
            return
        }
        Firebase.Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            if let error = error {
                //error could be short pass, or alway has account
                print(error)
            } else {
                
                Firebase.Auth.auth().signIn(withEmail: email, password: password, completion: nil)
                
                guard let uid = Firebase.Auth.auth().currentUser?.uid, let email = Firebase.Auth.auth().currentUser?.email else {
                    return
                }
                
                guard let username = self.usernameField.text else { return }
                
                let data : [String : Any] = [
                    "uid" : uid,
                    "email" : email,
                    "username" : username,
                    "role" : self.selectedRole,
                    "rating" : "5.0",
                    "collabs" : 0
                ]
                
                db.collection("users").document(uid).setData(data)

                Firebase.Auth.auth().currentUser?.createProfileChangeRequest().displayName = username
                
                do {
                    try Firebase.Auth.auth().signOut()
                } catch let error {
                    print (error)
                }
                
                self.dismiss(animated: true, completion: nil)
            }
        })
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

extension SignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.roles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRole = roles[row]
    }
    
}
