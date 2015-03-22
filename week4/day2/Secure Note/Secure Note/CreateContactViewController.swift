//
//  CreateContactViewController.swift
//  Secure Note
//
//  Created by Ryan Wijaya on 22/03/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class CreateContactViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func renderForm() -> [String : String?] {
        let contact = [
            "firstName" : firstNameField!.text,
            "lastName" : lastNameField!.text,
            "phone" : phoneNumberField!.text,
            "email" : emailAddressField!.text
        ]
        return contact
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
