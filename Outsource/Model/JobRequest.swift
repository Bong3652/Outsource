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
    var createdDate: Date
    var available: Bool
    
    init(requestID: String, lookingFor: String, description: String, user: User, createdDate: Date, available: Bool ) {
        
        self.requestID = requestID
        self.lookingFor = lookingFor
        self.description = description
        self.requestor = user.displayName ?? "anonymous"
        self.requestorID = user.uid
        self.createdDate = createdDate
        self.available = available
        
    }
    
}

