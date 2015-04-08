//
//  AddViewController.swift
//  Notify
//
//  Created by Ryan Wijaya on 7/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

let FLFUserAddedRecord = "UserAddedRecord"

class AddViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: UIButton) {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.postNotificationName(FLFUserAddedRecord, object: self, userInfo:
        [
            "firstName": firstNameField.text!,
            "lastName": lastNameField.text!
        ]
        )
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
