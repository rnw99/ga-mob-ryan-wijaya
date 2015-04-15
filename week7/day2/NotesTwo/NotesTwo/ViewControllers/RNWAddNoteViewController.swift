//
//  RNWAddNoteViewController.swift
//  NotesTwo
//
//  Created by Ryan Wijaya on 13/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import CoreData

class RNWAddNoteViewController: UIViewController {

    var appDelegate: AppDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear (animated: Bool) {
        let note = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: appDelegate!.managedObjectContext!) as Note
        // let note = Note()
        note.title = titleField.text
        note.text = textView.text
        note.createdAt = NSDate()
        
        appDelegate?.saveContext()
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
