//
//  ViewController.swift
//  ClickMe
//
//  Created by Ryan Wijaya on 5/03/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        label.text = "Hello World"
        label.textColor = UIColor.redColor()
    }
    
}

