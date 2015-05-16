//
//  ViewController.swift
//  Bloggr2
//
//  Created by Ryan Wijaya on 12/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func signUpTapped(sender: UIButton) {
        activityIndicator.startAnimating()
        
        let newUser = PFUser()
        newUser.username = emailField.text
        newUser.email = emailField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackgroundWithBlock() { succeeded, error in
            self.activityIndicator.stopAnimating()
            
            if let error = error {
                let errorString = error.userInfo?["error"] as? String
                
                let alertView = UIAlertView(title: "Sign Up Failed", message: errorString, delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
                
            } else {
                
                if let currentUser = PFUser.currentUser() {
                    println(currentUser.email!)
                }
                
            }
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

