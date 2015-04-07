//
//  MainCalcViewController.swift
//  RyansCalculator
//
//  Created by Ryan Wijaya on 2/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class MainCalcViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // var newValue: Double = 0
    var operation: String?
    var previousValue: Double = 0
    
    
    @IBAction func clear(sender: AnyObject) {
        self.operation = nil
        self.previousValue = 0
        self.displayLabel!.text = "0"
    }
    
    @IBAction func numberButtonTapped(sender: UIButton) {
        var numberText = sender.titleForState(.Normal)!
        var screen = self.displayLabel.text
        
      /*  if (self.operation != "") {
            display.text = String(format: "%g", newValue)
        } */
        
        if (numberText == ".") {
            if (screen?.rangeOfString(".") == nil) {
                screen = screen! + numberText
            }
        } else if (screen == "0") {
            screen = numberText
        } else {
            screen = screen! + numberText
        }
        self.displayLabel.text = screen
    }
    
    @IBAction func operationButtonTapped(sender: UIButton) {
        let operationText = sender.titleForState(.Normal)!
        let numberText = self.displayLabel!.text! as NSString
        
        self.operation = operationText
        self.previousValue = numberText.doubleValue
        self.displayLabel.text = "0"
    }
    
    @IBAction func directOperation(sender: UIButton) {
        let directOperationText = sender.titleForState(.Normal)!
        let numberText = self.displayLabel!.text! as NSString
        var result: Double = 0
        
        self.operation = directOperationText
        self.previousValue = numberText.doubleValue
        
        if (operation == "⁺/-") {
            result = self.previousValue * -1
        } else {
            result = self.previousValue / 100
        }
        self.displayLabel.text = String(format: "%g", result)
    }
    
    @IBAction func equalsButtonTapped(sender: UIButton) {
        let firstValue = self.previousValue
        let secondValue = (self.displayLabel!.text! as NSString).doubleValue
        var result: Double = 0
        
        if (operation == "÷") {
            if (secondValue == 0) {
                self.displayLabel.text = "Error"
            } else {
                result = firstValue / secondValue
                self.displayLabel.text = String(format: "%g", result)
            }
        } else if (operation == "x") {
            result = firstValue * secondValue
            self.displayLabel.text = String(format: "%g", result)
        } else if (operation == "−") {
            result = firstValue - secondValue
            self.displayLabel.text = String(format: "%g", result)
        } else {
            result = firstValue + secondValue
            self.displayLabel.text = String(format: "%g", result)
        }
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
