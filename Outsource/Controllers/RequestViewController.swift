//
//  RequestViewController.swift
//  Outsource
//
//  Created by APPLE on 6/3/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import UIKit
import Firebase

class RequestViewController: UIViewController {
    
    //enums in future
    let roles = ["Developer", "UI Designer", "Testor"]
    lazy var selectedRole = roles[0]

    @IBOutlet weak var rolePicker: UIPickerView!
    @IBOutlet weak var requestButton: UIButton!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rolePicker.delegate = self
        rolePicker.dataSource = self
    }
    
    @IBAction func didRequest(_ sender: UIButton) {
        
        let db = Firestore.firestore()
        guard let user = Firebase.Auth.auth().currentUser else {
            return
        }
        
        let preData : [String : Any] = [
            "requestID" : " ",
            "lookingFor" : " ",
            "description" : " ",
            "requestor" : " ",
            "requestorID" : " ",
            "available" : true
        ]
        
        let docRef = db.collection("requests").addDocument(data: preData)
        
        let data : [String : Any] = [
            "requestID" : docRef.documentID,
            "lookingFor" : self.selectedRole,
            "description" : self.descriptionField.text,
            "requestor" : user.displayName,
            "requestorID" : user.uid,
            "available" : true
        ]
        db.collection("requests").document(docRef.documentID).setData(data) { (error) in
            if error != nil {
                print(error)
            } else {
                self.resetFields()
            }
        }

    }
    
    func resetFields() {
        selectedRole = roles[0]
        self.descriptionField.text = ""
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

extension RequestViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
