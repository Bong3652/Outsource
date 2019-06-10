//
//  User.swift
//  Outsource
//
//  Created by APPLE on 5/27/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import Foundation

struct CustomUser {
    var collab: Int
    var email: String
    var rating: String
    var role: String
    var uid: String
    var username: String
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as! String
        self.collab = dictionary["collabs"] as! Int
        self.rating = dictionary["rating"] as! String
        self.role = dictionary["role"] as! String
        self.uid = dictionary["uid"] as! String
        self.username = dictionary["username"] as! String
    }
}
