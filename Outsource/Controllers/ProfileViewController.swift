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
    
    let user = Firebase.Auth.auth().currentUser
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
         setupProfile()
    }
    
    func setupProfile() {
        
        guard let uid = user?.uid else {
            return
        }
        
//        let docRef = db.collection("users").document(uid)
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
        
        db.collection("users").document(uid).getDocument { (snap, error) in
            if let snapshot = snap {
                guard let username = snapshot.data()?["username"] as? String, let collabs = snapshot.data()?["collabs"] as? Int, let rating = snapshot.data()?["rating"] as? String, let role = snapshot.data()?["role"] as? String else { return }
                self.profileNameLabel.text = username
                self.collaborationCounts.text = "\(collabs)"
                self.ratingLabel.text = rating
                self.roleLabel.text = role
            } else {
                print(error)
            }
        }
    }
    
    @IBAction func didTapProfileImage(_ sender: UITapGestureRecognizer) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        
        guard let data = profileImage.image?.pngData() else { return }
        
        changeImage(pngData: data)
        
    }
    
    @IBAction func didLogout(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            let main = UIStoryboard(name: "Main", bundle: nil)
            let AuthoVC = main.instantiateViewController(withIdentifier: "AuthoViewController")
            
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.window?.rootViewController = AuthoVC
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func changeImage(pngData: Data) {
        
        guard let uid = user?.uid else {
            return
        }
        
        let document = db.collection("users").document(uid)
        let id = document.documentID

        let storage = Storage.storage().reference(withPath: "users/\(uid)/\(id).png")
        let metadata = StorageMetadata()

        metadata.contentType = "image/png"
        
        storage.putData(pngData, metadata: metadata) { (result, error) in
            if error != nil {
                print(error)
            }
        }
        
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

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = info[.editedImage] as! UIImage
//        let size = CGSize(width: 300, height: 300)
//        let scaledImage = image.af_imageAspectScaled(toFill: size)
//
//        photoView.image = scaledImage
//        dismiss(animated: true, completion: nil)
    }
    
}
