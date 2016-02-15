//
//  ComposeViewController.swift
//  YikYakClone
//
//  Created by Jesse Hu on 2/10/16.
//  Copyright © 2016 Jesse Hu. All rights reserved.
//

import UIKit
import KMPlaceholderTextView

protocol ComposeDelegate {
    func sendNewYak(yak: Yak)
}

class ComposeViewController: UIViewController, UITextViewDelegate {

    var delegate: ComposeDelegate?
    
    @IBOutlet var textView: KMPlaceholderTextView! {
        didSet {
            textView.delegate = self
        }
    }
    @IBOutlet var characterCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        textView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendButtonPressed(sender: AnyObject) {
        createNewYak(textView.text)
    }
    
    // MARK: - UITextView delegate
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text.containsString("\n") {
            createNewYak(textView.text)
            return false
        }
        
        let textLength = textView.text.characters.count + text.characters.count - range.length
        // range.length is 1 when deleting a character
        characterCountLabel.text = String(200 - textLength)
        if textLength >= 200 {
            return false
        } else {
            return true
        }
    }
    
    // MARK: - Actions
    
    func createNewYak(text: String) {
        let newYak = Yak(text: text, timestamp: NSDate())
        delegate?.sendNewYak(newYak)
        self.dismissViewControllerAnimated(true, completion: nil)
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
