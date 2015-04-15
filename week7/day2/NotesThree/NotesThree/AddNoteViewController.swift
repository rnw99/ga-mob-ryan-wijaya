//
//  AddNoteViewController.swift
//  NotesThree
//
//  Created by Ryan Wijaya on 15/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    // needs to saveContext() when clicking "Done"
    // and return to TableView
    
    @IBOutlet weak var textView: UITextView!
    
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
