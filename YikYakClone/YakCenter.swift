//
//  YakCenter.swift
//  YikYakClone
//
//  Created by Davis Gossage on 2/20/16.
//  Copyright © 2016 Jesse Hu. All rights reserved.
//

import UIKit
import Firebase

protocol YakFeedDelegate{
    func yakAddedToFeed()
}

class YakCenter: NSObject {
    static let sharedInstance = YakCenter()
    var yakFeedDelegate: YakFeedDelegate?
    
    //this is our base reference to our firebase database
    static let baseURL = "https://yik-yak-clone.firebaseio.com"
    let baseRef = Firebase(url: "\(baseURL)")
    let yakRef = Firebase(url: "\(baseURL)/yaks")
    
    var allYaks = [Yak]()
    
    override init() {
        super.init()
        //we setup listeners for when remote data changes, this is the primary way of reading data via firebase
        yakRef.queryOrderedByChild("timestamp").observeEventType(.Value) { (snapshot: FDataSnapshot!) -> Void in
            self.allYaks.removeAll()
            //here we get all of the yaks (children), convert them to snapshots, and make sure there is at least 1
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for yakSnapshot in snapshots{
                    self.allYaks.append(Yak(dictionary: yakSnapshot.value as! Dictionary<String, AnyObject>))
                }
            }
            self.yakFeedDelegate?.yakAddedToFeed()
        }
    }
    
    
    func postYak(yak: Yak){
        let newYakRef = yakRef.childByAutoId()
        newYakRef.setValue(yak.toDictionary())
    }
}
