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

protocol ReplyFeedDelegate{
    func replyAddedToFeed()
}

class YakCenter: NSObject {
    static let sharedInstance = YakCenter()
    var yakFeedDelegate: YakFeedDelegate?
    var replyFeedDelegate: ReplyFeedDelegate?
    
    //this is our base reference to our firebase database
    static let baseURL = "https://yik-yak-clone.firebaseio.com"
    let baseRef = Firebase(url: "\(baseURL)")
    let yakRef = Firebase(url: "\(baseURL)/yaks")
    let replyRef = Firebase(url: "\(baseURL)/replies")
    
    var allYaks = [Yak]()
    
    var subscribedReplyHandle: UInt?
    
    override init() {
        super.init()
        //we setup listeners for when remote data changes, this is the primary way of reading data via firebase
        yakRef.queryOrderedByChild("timestamp").observeEventType(.Value) { (snapshot: FDataSnapshot!) -> Void in
            self.allYaks.removeAll()
            //here we get all of the yaks (children), convert them to snapshots, and make sure there is at least 1
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for yakSnapshot in snapshots{
                    self.allYaks.append(Yak(dictionary: yakSnapshot.value as! Dictionary<String, AnyObject>, snapshot: yakSnapshot))
                }
            }
            self.yakFeedDelegate?.yakAddedToFeed()
        }
    }
    
    func subscribeToRepliesForYak(yak: Yak){
        //cancel existing subscription
        if (subscribedReplyHandle != nil){
            replyRef.removeObserverWithHandle(subscribedReplyHandle!)
        }
        subscribedReplyHandle = replyRef.childByAppendingPath(yak.snapshot!.key).observeEventType(.Value) { (snapshot: FDataSnapshot!) -> Void in
            yak.replies.removeAll()
            //here we get all of the replies (children), convert them to snapshots, and make sure there is at least 1
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for replySnapshot in snapshots{
                    yak.replies.append(Reply(dictionary: replySnapshot.value as! Dictionary<String, AnyObject>, snapshot: replySnapshot))
                }
            }
            self.replyFeedDelegate?.replyAddedToFeed()
        }
    }
    
    func postYak(yak: Yak){
        let newYakRef = yakRef.childByAutoId()
        newYakRef.setValue(yak.toDictionary())
    }
    
    func postReply(reply: Reply, yak: Yak){
        let newReplyRef = replyRef.childByAppendingPath(yak.snapshot!.key).childByAutoId()
        newReplyRef.setValue(reply.toDictionary())
    }
}
