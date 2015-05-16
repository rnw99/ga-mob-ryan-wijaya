//
//  LogInViewController.swift
//  Bloggr2
//
//  Created by Ryan Wijaya on 12/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func logInTapped(sender: UIButton) {
        activityIndicator.startAnimating()
        
        PFUser.logInWithUsernameInBackground(emailField.text, password: passwordField.text) { user, error in
         
            self.activityIndicator.stopAnimating()
            
            if let error = error {
                let errorString = error.userInfo?["error"] as? String
                
                let alertView = UIAlertView(title: "Log In Failed", message: errorString, delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
            }
            
            
        }
        
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Create post with user
        if let currentUser = PFUser.currentUser() {
            let newPost = PFObject(className: "Post")
            newPost["title"] = "Hello World"
            newPost["user"] = currentUser
            
            let userEditEveryoneReadACL = PFACL(user: currentUser)
            userEditEveryoneReadACL.setPublicReadAccess(true)
            newPost.ACL = userEditEveryoneReadACL
            
//            PFACL.setDefaultACL(userEditEveryoneReadACL, withAccessForCurrentUser: true)
            
            
            
            newPost.saveInBackgroundWithBlock() { success, error in
                
            }
            
        // Find posts by user
            let userPostsQuery = PFQuery(className: "Post")
            userPostsQuery.whereKey("user", equalTo: currentUser)
            userPostsQuery.findObjectsInBackgroundWithBlock() { objects, error in
            }
        }
        
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
