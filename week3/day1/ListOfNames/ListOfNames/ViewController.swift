//
//  ViewController.swift
//  ListOfNames
//
//  Created by Ryan Wijaya on 17/03/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var contact = ["":""]
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel!.text = contact["firstName"]! + " " + contact["lastName"]!
        // nameLabel!.text = name!
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

