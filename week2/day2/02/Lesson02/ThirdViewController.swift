//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func evenator(sender: AnyObject) {
        var number = inputNum.text.toInt()!
        
        if (number % 2 == 0) {
            outputLabel.text = "is even"
        } else {
            outputLabel.text = "is not even"
        }
    }
    
}
