//
//  PostTableViewController.swift
//  YikYakClone
//
//  Created by Jesse Hu on 2/10/16.
//  Copyright © 2016 Jesse Hu. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController, ComposeDelegate {
    
    var yaks = [Yak]()
    
    @IBAction func segmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            break
        case 1:
            break
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return yaks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PostTableViewCell
        
        let yak = yaks[indexPath.row]
        cell.postTextLabel.text = yak.text
        
        if let date = yak.timestamp {
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Year, .WeekOfYear, .Day, .Hour, .Minute, .Second], fromDate: date, toDate: NSDate(), options: [])
            if components.year > 0 {
                cell.timeLabel.text = "\(components.year)y"
            } else if components.weekOfYear > 0 {
                cell.timeLabel.text = "\(components.weekOfYear)w"
            } else if components.day > 0 {
                cell.timeLabel.text = "\(components.day)d"
            } else if components.hour > 0 {
                cell.timeLabel.text = "\(components.hour)h"
            } else if components.minute > 0 {
                cell.timeLabel.text = "\(components.minute)m"
            } else if components.second > 0 {
                cell.timeLabel.text = "\(components.second)s"
            } else {
                cell.timeLabel.text = "Just now"
            }
        } else {
            cell.timeLabel.text = nil
        }
        
        if yak.replies.count > 0 {
            cell.repliesLabel.text = "💬 \(yak.replies.count) Replies"
        } else {
            cell.repliesLabel.text = "💬 Reply"
        }
        
        return cell
    }
    
    // MARK: - Compose delegate
    
    func sendNewYak(yak: Yak) {
        yaks.append(yak)
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "composeSegue" {
            if let navigationController = segue.destinationViewController as? UINavigationController {
                if let composeVC = navigationController.viewControllers.first as? ComposeViewController {
                    composeVC.delegate = self
                }
            }
        }
    }

}