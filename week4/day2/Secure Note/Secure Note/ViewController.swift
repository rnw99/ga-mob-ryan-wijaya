//
//  ViewController.swift
//  Secure Note
//
//  Created by Ryan Wijaya on 21/03/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var contact = ["":""]
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fullNameLabel!.text = contact["firstName"]! + " " + contact["lastName"]!
        phoneLabel!.text = contact["phone"]!
        emailLabel!.text = contact["email"]!

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

