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
    
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var result: Int = 0
    var operation = ""
    
    @IBAction func numberInput(sender: AnyObject) {
        screen.text = sender.currentTitle
    }
    
    @IBAction func operation(sender: AnyObject) {
        firstNumber = screen.text!.toInt()!
        operation = sender.currentTitle!!
        
    }
    
    @IBAction func equals(sender: AnyObject) {
        secondNumber = screen.text!.toInt()!
        
        if (operation == "+/-") {
            result = firstNumber * -1
        } else if (operation == "%") {
            result = firstNumber / 100
        } else if (operation == "/") {
            result = firstNumber / secondNumber
        } else if (operation == "x") {
            result = firstNumber * secondNumber
        } else if (operation == "-") {
            result = firstNumber - secondNumber
        } else {
            result = firstNumber + secondNumber
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
