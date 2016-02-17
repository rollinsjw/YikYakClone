//
//  ReplyTableViewCell.swift
//  
//
//  Created by Jesse Hu on 2/17/16.
//
//

import UIKit

class ReplyTableViewCell: UITableViewCell {

    @IBOutlet var textView: UITextView! {
        didSet {
            textView.textContainer.lineFragmentPadding = 0
            textView.textContainerInset = UIEdgeInsetsZero
        }
    }
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var voteCountLabel: UILabel!
    
    var delegate: PostTableViewCellDelegate?
    var indexPath: NSIndexPath?
    
//    @IBAction func upvoteButtonPressed(sender: UIButton) {
//        if let indexPath = indexPath, delegate = delegate {
//            delegate.didUpvoteCellAtIndexPath(indexPath)
//        }
//    }
//    @IBAction func downvoteButtonPressed(sender: UIButton) {
//        if let indexPath = indexPath, delegate = delegate {
//            delegate.didDownvoteCellAtIndexPath(indexPath)
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
