//
//  CalcViewController.swift
//  Calculator
//
//  Created by Ryan Wijaya on 28/03/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

// #import <QuartzCore/QuartzCore.h>


class CalcViewController: UIViewController {

    // width 320,  length 120
    // iphone 4 width 320, length 480
    // button width 80, height 72
    
    @IBOutlet weak var screen: UILabel!
    
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var isTypingNumber = false
    var result: Int = 0
    var operation = ""
    
    
    @IBAction func number(sender: AnyObject) {
        var number = sender.currentTitle
        if (isTypingNumber == true) {
            screen.text = screen.text! + number!!
        } else {
        screen.text = number
        }
        isTypingNumber = true
    }
    
    @IBAction func operation(sender: AnyObject) {
        firstNumber = screen.text!.toInt()!
        operation = sender.currentTitle!!
        
        if (operation == "+/-") {
            result = result * -1
        } else if (operation == "%") {
            result = result / 100
        } else if (operation == "÷") {
            result = firstNumber / secondNumber
        } else if (operation == "x") {
            result = firstNumber * secondNumber
        } else if (operation == "−" ) {
            result = firstNumber - secondNumber
        } else {
            result = firstNumber + secondNumber
        }
        screen.text = "\(result)"
    }
    
    @IBAction func equals(sender: AnyObject) {
    }
    
    
    @IBAction func clear(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      /*  _btn.layer.borderWidth=1.0f;
        _btn.layer.borderColor=[[UIColor blackColor] CGColor];
    */
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
