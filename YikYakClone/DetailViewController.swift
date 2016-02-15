//
//  DetailViewController.swift
//  YikYakClone
//
//  Created by Jesse Hu on 2/15/16.
//  Copyright © 2016 Jesse Hu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var yakTextView: UITextView!
    @IBOutlet var voteCountLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var repliesLabel: UILabel!
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var yak: Yak?
    var delegate: ComposeDelegate?
    
    @IBAction func shareButtonPressed(sender: UIButton) {
        // MARK: - TODO: Share Button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let yak = yak {
            return yak.replies.count
        } else {
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("replyCell", forIndexPath: indexPath) as! PostTableViewCell
//        
//        // Set delegate
//        cell.delegate = self
//        cell.indexPath = indexPath
//        
//        let yak = yaks[indexPath.row]
//        cell.textView.text = yak.text
//        
//        if let date = yak.timestamp {
//            let calendar = NSCalendar.currentCalendar()
//            let components = calendar.components([.Year, .WeekOfYear, .Day, .Hour, .Minute, .Second], fromDate: date, toDate: NSDate(), options: [])
//            if components.year > 0 {
//                cell.timeLabel.text = "\(components.year)y"
//            } else if components.weekOfYear > 0 {
//                cell.timeLabel.text = "\(components.weekOfYear)w"
//            } else if components.day > 0 {
//                cell.timeLabel.text = "\(components.day)d"
//            } else if components.hour > 0 {
//                cell.timeLabel.text = "\(components.hour)h"
//            } else if components.minute > 0 {
//                cell.timeLabel.text = "\(components.minute)m"
//            } else if components.second > 0 {
//                cell.timeLabel.text = "\(components.second)s"
//            } else {
//                cell.timeLabel.text = "Just now"
//            }
//        } else {
//            cell.timeLabel.text = nil
//        }
//        
//        if yak.replies.count > 0 {
//            cell.repliesLabel.text = "💬 \(yak.replies.count) Replies"
//        } else {
//            cell.repliesLabel.text = "💬 Reply"
//        }
//        
//        cell.voteCountLabel.text = String(yaks[indexPath.row].netVoteCount)
//        
//        return cell

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
