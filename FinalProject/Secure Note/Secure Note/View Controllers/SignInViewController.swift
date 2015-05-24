//
//  RNW_SN_SignInViewController.swift
//  Secure Note
//
//  Created by Ryan Wijaya on 16/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts



class SignInViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func didTapMainView(sender: UITapGestureRecognizer) {
        emailAddress.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    
    @IBAction func signIn(sender: UIButton) {
        
        emailAddress.resignFirstResponder()
        password.resignFirstResponder()
        
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        var userEmailAddress = emailAddress.text
        userEmailAddress = userEmailAddress.lowercaseString
        
        var userPassword = password.text
        
        PFUser.logInWithUsernameInBackground(userEmailAddress, password: userPassword) {
            (user: PFUser?, error: NSError?) -> Void in
            
            self.activityIndicator.stopAnimating()
            
            if user != nil {
                
                self.checkUserVerifiedEmail(user!)
                
            } else {
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)"
                    
                }
            }
        }
        
    }
    
    func checkUserVerifiedEmail(user: PFUser) {
        
        if (user.objectForKey("emailVerified")!.boolValue == true){
            println("Login successful. Verified email used.")
            
            dispatch_async(dispatch_get_main_queue()) {
                self.performSegueWithIdentifier("ToTableView", sender: self)
            }
            
        } else {
            println("Login failed. Email not verified.")
            
            // Tell user that they must verify their email address
            let alertController = UIAlertController(title: "Email not verified.", message: "To proceed using this App, please check your email and follow the verification instructions provided.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil ))
            
            // alertController.addAction(UIAlertAction(title: "I do NOT agree", style: UIAlertActionStyle.Default, handler: nil))
            
            // Display alert
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    func processSignIn() {
        
        PFUser.currentUser()!.fetchInBackgroundWithBlock { (result, error) -> Void in
            
           self.checkUserVerifiedEmail(PFUser.currentUser()!)
        }
        
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
