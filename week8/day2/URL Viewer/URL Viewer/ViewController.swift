//
//  ViewController.swift
//  URL Viewer
//
//  Created by Ryan Wijaya on 16/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func loadURLPressed(sender: UIButton) {
        
        
        let urlString = self.urlField!.text!
        let url = NSURL(string: urlString)
        
        let session = NSURLSession.sharedSession()
        let request = session.dataTaskWithURL(url!) { (data, response, error) in
            self.webView.loadData(data, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: url)
        }
            request.resume()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

