//
//  DetailViewController.swift
//  SwiftParsePractice
//
//  Created by Ryan Wijaya on 9/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameEnglish: UITextField!
    @IBOutlet weak var nameLocal: UITextField!
    @IBOutlet weak var capital: UITextField!
    @IBOutlet weak var currencyCode: UITextField!
    
    // The save button
    @IBAction func saveButton(sender: UIBarButtonItem) {

    /* THIS WAS FROM TUTORIAL PART 2 (where there was no option to create a new record
        
        // Unwrap the current object
        if let object = currentObject {
            object["nameEnglish"] = nameEnglish.text
            object["nameLocal"] = nameLocal.text
            object["capital"] = capital.text
            object["currencyCode"] = currencyCode.text
            
            // Save the data back to the server in a background task
            object.saveEventually(nil)
        }
        
        // return to table view
        self.navigationController?.popViewControllerAnimated(true)
        
    */
        
        if let updateObject = currentObject as PFObject? {
            
            // Update the existing parse object
            updateObject["nameEnglish"] = nameEnglish.text
            updateObject["nameLocal"] = nameLocal.text
            updateObject["capital"] = capital.text
            updateObject["currencyCode"] = currencyCode.text
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
            
        } else {
            
            // Create a new parse object
            var updateObject = PFObject(className: "Countries")
            
            updateObject["nameEnglish"] = nameEnglish.text
            updateObject["nameLocal"] = nameLocal.text
            updateObject["capital"] = capital.text
            updateObject["currencyCode"] = currencyCode.text
            updateObject.ACL = PFACL(user: PFUser.currentUser()!)
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
        }
        
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    // Container to store the view table selected object
    var currentObject : PFObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let object = currentObject {
            nameEnglish.text = object["nameEnglish"] as? String
            nameLocal.text = object["nameLocal"] as? String
            capital.text = object["capital"] as? String
            currencyCode.text = object["currencyCode"] as? String
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
