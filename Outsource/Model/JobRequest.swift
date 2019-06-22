//
//  JobRequest.swift
//  Outsource
//
//  Created by APPLE on 5/20/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import Foundation
import FirebaseAuth

class JobRequest {
    
    var requestID: String
    var lookingFor: String
    var description: String
    var requestor: String
    var requestorID: String
    var available: Bool
    
    init(requestID: String, lookingFor: String, description: String, requestor: String, requestorID: String, available: Bool ) {
        
        self.requestID = requestID
        self.lookingFor = lookingFor
        self.description = description
        self.requestor = requestor
        self.requestorID = requestorID
        self.available = available
        
    }
    
    init(dictionary: [String : Any]) {
        self.requestID = dictionary["requestID"] as! String
        self.lookingFor = dictionary["lookingFor"] as! String
        self.description = dictionary["description"] as! String
        self.requestor = dictionary["requestor"] as? String ?? "Unknown"
        self.requestorID = dictionary["requestorID"] as! String
        self.available = dictionary["available"] as! Bool
    }

}

