//
//  Reply.swift
//  YikYakClone
//
//  Created by Jesse Hu on 2/10/16.
//  Copyright © 2016 Jesse Hu. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase

class Reply: NSObject {
    var text: String
    var timestamp: NSDate?
    var netVoteCount: Int
    var location: CLLocationCoordinate2D?
    var snapshot: FDataSnapshot?
    
    init(text: String, timestamp: NSDate?, location: CLLocationCoordinate2D?) {
        self.text = text
        self.timestamp = timestamp
        self.netVoteCount = 0
        self.location = location
    }
    
    
}
