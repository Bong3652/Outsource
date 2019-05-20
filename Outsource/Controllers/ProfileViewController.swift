//
//  ProfileViewController.swift
//  Outsource
//
//  Created by APPLE on 5/18/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var collaborationCounts: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user = Firebase.Auth.auth().currentUser
    }
    
    @IBAction func didTapProfileImage(_ sender: UITapGestureRecognizer) {
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
