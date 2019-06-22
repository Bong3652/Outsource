//
//  FeedViewController.swift
//  Outsource
//
//  Created by APPLE on 6/20/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import UIKit
import Firebase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var feedTable: UITableView!
    
    var requests = [JobRequest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        feedTable.delegate = self
        feedTable.dataSource = self
        
        feedTable.rowHeight = 215
        
        //getDocs()
        //feedTable.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        getDocs()
        feedTable.reloadData()
        
    }
    
    func getDocs() {
        let db = Firestore.firestore()
        
        db.collection("requests").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let request = JobRequest(dictionary: document.data())
                    print(request.lookingFor)
                    self.requests.append(request)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(requests.count)
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTable.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! RequestCell
        
        cell.profileName.text = self.requests[indexPath.row].requestor
        cell.requestDescription.text = self.requests[indexPath.row].description
        cell.requestTitleLabel.text = "Looking for a  \(self.requests[indexPath.row].lookingFor)"
        
        return cell
        
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

