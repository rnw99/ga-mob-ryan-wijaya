//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
    
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func cumulativeSum(sender: AnyObject) {
            var sum : Int = outputLabel.text!.toInt()!
        
            sum += inputNum.text.toInt()!
        
            outputLabel.text = "\(sum)"
        
        }
        
}

