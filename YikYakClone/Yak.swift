//
//  Yak.swift
//  YikYakClone
//
//  Created by Jesse Hu on 2/10/16.
//  Copyright © 2016 Jesse Hu. All rights reserved.
//

import UIKit

class Yak: NSObject {
    var text: String?
    var timestamp: NSDate?
    var replies: [Reply]
    var netVoteCount: Int
    // MARK: - TODO: Votes
    
    init(text: String, timestamp: NSDate) {
        self.text = text
        self.timestamp = timestamp
        self.replies = [Reply]()
        self.netVoteCount = 0
    }
}
