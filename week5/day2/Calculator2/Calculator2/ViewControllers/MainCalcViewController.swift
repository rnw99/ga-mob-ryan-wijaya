//
//  MainCalcViewController.swift
//  Calculator2
//
//  Created by Ryan Wijaya on 29/03/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class MainCalcViewController: UIViewController {

    @IBOutlet weak var screen: UILabel!
    
    // use float for decimal points
    // divide something by zero displays Error
    // no need to display 1+10e for really large numbers
    // A & AC not necessary
    // swipe display screen to clear
    
    var firstNumber: Double? = 0.0
    var secondNumber: Double? = 0.0
    var result: Double = 0.0
    var operation = ""
    
    @IBAction func numberInput(sender: AnyObject) {
        var tempString = screen.text
        
        if (sender.currentTitle == ".") {
            if (tempString?.rangeOfString(".") == nil) {
                tempString = tempString! + sender.currentTitle!!
            }
        } else if (tempString == "0") {
            tempString = sender.currentTitle!!
        } else {
            tempString = tempString! + sender.currentTitle!!
        }
        
        screen.text = tempString
    }
    
    @IBAction func operation(sender: AnyObject) {
        
        var aNumber = NSNumberFormatter().numberFromString(screen.text!)
        firstNumber = aNumber?.doubleValue
        
        operation = sender.currentTitle!!
        
    }
    
    @IBAction func equals(sender: AnyObject) {
        
        var aNumber = NSNumberFormatter().numberFromString(screen.text!)
        secondNumber = aNumber?.doubleValue
        
        if (operation == "⁺/-") {
            result = firstNumber! * -1
        } else if (operation == "%") {
            result = firstNumber! / 100
        } else if (operation == "÷") {
            result = firstNumber! / secondNumber!
        } else if (operation == "x") {
            result = firstNumber! * secondNumber!
        } else if (operation == "-") {
            result = firstNumber! - secondNumber!
        } else {
            result = firstNumber! + secondNumber!
        }
        screen.text = "\(result)"
        
    }
    
    @IBAction func clear(sender: AnyObject) {
        firstNumber = 0
        secondNumber = 0
        result = 0
        screen.text = "\(result)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
