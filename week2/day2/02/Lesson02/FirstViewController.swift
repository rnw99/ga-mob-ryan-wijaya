//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’*/
    
    @IBOutlet weak var label: UILabel!

    // the following is a function to change the label to "Hello World!"
    @IBAction func pressedButton(sender: AnyObject) {
        label.text = "Hello World!"
    }
    
    
    /* TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!” */
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    
    // the following is a function to print a sentence displaying the input name and age
    @IBAction func displayText(sender: AnyObject) {
        var yourName = name.text
        var yourAge = age.text
        
        println("Hello \(yourName), you are \(yourAge) years old!")
    }

    
    /* TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive” */
    
    // the following is a function to determine whether a user can drink, vote or drive based on their age and display the outcome as an output
    @IBAction func firstLogic(sender: AnyObject) {
        var yourName = name.text
        var yourAge = age.text
        
        if let yourAge = age.text.toInt() {
            if (yourAge >= 21) {
                println("You can drink")
            } else if (yourAge >= 18) {
                println("You can vote")
            } else if (yourAge >= 16) {
                println("You can drive")
            }
        }
    }
    
    
    /* TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */
    
    //the following is a function to determine the actions (may be more than one) the user can do based on their age input and display them as an output
    @IBAction func secondLogic(sender: AnyObject) {
        var yourName = name.text
        var yourAge = age.text
        
        if let yourAge = age.text.toInt() {
            if (yourAge >= 16 && yourAge < 18) {
                println("You can drive")
            } else if (yourAge >= 18 && yourAge < 21) {
                println("You can drive and vote")
            } else if (yourAge >= 21) {
                println("You can drive, vote and drink (but not at the same time!)")
            }
        }
    }
    
    
    
}
