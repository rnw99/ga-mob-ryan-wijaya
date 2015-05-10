//
//  ViewController.swift
//  Tripod
//
//  Created by Ryan Wijaya on 5/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import SVProgressHUD
import SwiftyJSON

class ViewController: UIViewController {

    // (Dictionary<NSObject, AnyObject>)
    
    func getData(url: NSURL, completionHandler: ([JSON]) -> ()) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "https://api.bitfinex.com/v1/ticker/btcusd")
        
        let task = session.dataTaskWithURL(url!) { data, response, error in
            if (error != nil) {
                println(error.description)
                return
            }
            
            let dataFromJSON = JSON(data: data)
            println(dataFromJSON)
            
            if let midPrice = dataFromJSON["mid"].string {
                println(midPrice)
            }
        }
        
        task.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

