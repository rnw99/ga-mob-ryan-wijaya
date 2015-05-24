//
//  DetailViewController.swift
//  Secure Note
//
//  Created by Ryan Wijaya on 16/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//



import UIKit
import Parse
import ParseUI
import Bolts
import SVProgressHUD

class DetailViewController: UIViewController {

    @IBOutlet weak var LastUpdatedAtLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var notesText: UITextView!
    
    // Example of how to have a textview that varies its height whenever the keyboard shows/hides.
    
    // Further information from:
    // https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html#//apple_ref/doc/uid/TP40009542-CH5-SW7
    // http://dasdev.de/2014/11/29/adjust-for-the-keyboard-in-ios-using-swift/
    
    @IBOutlet weak var textViewToBottomLayoutGuideConstraint: NSLayoutConstraint!
    
    var textViewToBottomLayoutGuideConstraint_OriginalValue: CGFloat = 0.0
    
    
    var currentObject : PFObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("\(__FUNCTION__) [\(__LINE__)]")
        
        // Do any additional setup after loading the view.
        
        
        // Original constraint value
        textViewToBottomLayoutGuideConstraint_OriginalValue = self.textViewToBottomLayoutGuideConstraint.constant
        
        // Give the textview a border
        notesText.layer.borderWidth = 1.0
        notesText.layer.borderColor = UIColor(white: 0.0, alpha: 1.0).CGColor
        
        
        if let object = currentObject {
            titleText.text = object["titleText"] as? String
            notesText.text = object["notesText"] as? String
            
            let dateFormatter = NSDateFormatter()
            
            dateFormatter.dateFormat = "h:mma, dd MMMM yyyy"
            
            var dateString = dateFormatter.stringFromDate(object.updatedAt!)
            
            println(dateString)
            
            LastUpdatedAtLabel.text = "Last updated at \(dateString)"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // -----------------------------------------------------------
    // MARK: - Scene Appearance
    // -----------------------------------------------------------
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Register for any notifications whenever this scene appears
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Deregister any notifications whenever this scene disappears
        unRegisterForKeyboardNotifications()
    }
    
    
    // -----------------------------------------------------------
    // MARK: - Notifications Registration/ Unregistration
    // -----------------------------------------------------------
    
    func registerForKeyboardNotifications() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unRegisterForKeyboardNotifications() {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    // -----------------------------------------------------------
    // MARK: - Keyboard Notifications
    // -----------------------------------------------------------
    
    // Called when the UIKeyboardDidShowNotification is sent.
    func keyboardWillShow(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height {
                
                // Set the bottom constraint to the height of the keyboard plus the original offset value
                textViewToBottomLayoutGuideConstraint.constant = keyboardHeight + textViewToBottomLayoutGuideConstraint_OriginalValue
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    // Called when the UIKeyboardWillHideNotification is sent
    func keyboardWillHide(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height {
                
                // Set the bottom constraint back to the original offset value
                textViewToBottomLayoutGuideConstraint.constant = textViewToBottomLayoutGuideConstraint_OriginalValue
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }

    @IBAction func didTapMainView(sender: UITapGestureRecognizer) {
        titleText.resignFirstResponder()
        notesText.resignFirstResponder()
    }
    
    
    
    @IBAction func save(sender: UIBarButtonItem) {
        println("\(__FUNCTION__) [\(__LINE__)]")
        
//        titleText.resignFirstResponder()
//        notesText.resignFirstResponder()

        // check if either title or notes fields is blank
        
        if (titleText.text == "") {
            
            println("\(__FUNCTION__) [\(__LINE__)]")
            
            titleLabel.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            titleLabel.text = "Enter title to save"
            
        } else if (notesText.text == "") {
            
            println("\(__FUNCTION__) [\(__LINE__)]")
            
            notesLabel.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            notesLabel.text = "Enter note to save"
            
        } else {
            
            println("\(__FUNCTION__) [\(__LINE__)]")
            
            // If currentObject already exists (passed from previous scene)
            // then we're updating it
            if let updateObject = currentObject as PFObject? {
                println("\(__FUNCTION__) [\(__LINE__)]")
            
                // Update the existing parse object
                updateObject["titleText"] = titleText.text
                updateObject["notesText"] = notesText.text
                updateObject.ACL = PFACL(user: PFUser.currentUser()!)
            
                // Save the data back to the server in a background task
                updateObject.saveInBackgroundWithBlock( { (succeeded, error) -> Void in
                
                    let alertController = UIAlertController(title: "Saved", message: "Note successfully saved.", preferredStyle: UIAlertControllerStyle.Alert)
                
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                    // Display Alert
                    self.presentViewController(alertController, animated: true, completion: nil)
                
                    // Auto close alert after a set time if OK button is not pressed
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)))
                
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                    
                        if alertController.isBeingDismissed() {
                        
                            // Return to table view
                            self.navigationController?.popViewControllerAnimated(true)
                        
                        } else {
                        
                            alertController.dismissViewControllerAnimated(true, completion: { () -> Void in
                            
                                // Return to table view
                                self.navigationController?.popViewControllerAnimated(true)
                            
                            })
                        }
                    }
                })
            
            } else {
            
                // If currentObject is nil (because it doesn't exist)
                // then we're creating a new one
            
                println("\(__FUNCTION__) [\(__LINE__)] Didn't save. currentObject is nil ")
            
                // Create a new parse object
                var updateObject = PFObject(className: "Notes")
            
                updateObject["titleText"] = titleText.text
                updateObject["notesText"] = notesText.text
                updateObject.ACL = PFACL(user: PFUser.currentUser()!)
        
                // Save the data back to the server in a background task
                updateObject.saveInBackgroundWithBlock( { (succeeded, error) -> Void in
                
                    let alertController = UIAlertController(title: "Saved", message: "Note successfully saved.", preferredStyle: UIAlertControllerStyle.Alert)
                
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                    // Display Alert
                    self.presentViewController(alertController, animated: true, completion: nil)
                
                    // Auto close alert after a set time if OK button is not pressed
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)))
                
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                    
                        if alertController.isBeingDismissed() {
                        
                            // Return to table view
                            self.navigationController?.popViewControllerAnimated(true)
                        
                        } else {
                        
                            alertController.dismissViewControllerAnimated(true, completion: { () -> Void in
                            
                                // Return to table view
                                self.navigationController?.popViewControllerAnimated(true)
                            
                            })
                        }
                    }
                })
            }
        }
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
