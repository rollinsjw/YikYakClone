//
//  Yak.swift
//  YikYakClone
//
//  Created by Jesse Hu on 2/10/16.
//  Copyright © 2016 Jesse Hu. All rights reserved.
//

import UIKit
import CoreLocation

class Yak: NSObject {
    var text: String
    var timestamp: NSDate?
    var replies: [Reply]
    var netVoteCount: Int
    var location: CLLocationCoordinate2D?
    
    init(text: String, timestamp: NSDate?, location: CLLocationCoordinate2D?) {
        self.text = text
        self.timestamp = timestamp
        self.replies = [Reply]()
        self.netVoteCount = 0
        self.location = location
    }
    
    //we need an initializer for turning a dictionary from firebase into an object
    init(dictionary: Dictionary<String, AnyObject>){
        self.text = dictionary["text"] as! String
        self.replies = [Reply]()
        self.netVoteCount = 0
    }
    
    func toDictionary() -> Dictionary<String, AnyObject> {
        return [
            "text": text
        ]
    }
}
