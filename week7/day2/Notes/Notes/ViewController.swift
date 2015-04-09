//
//  ViewController.swift
//  Notes
//
//  Created by Ryan Wijaya on 9/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var appDelegate: AppDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   override func viewWillAppear(animated: Bool) {
        let notesFetchRequest = NSFetchRequest(entityName: "Note")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        notesFetchRequest.sortDescriptors = [sortDescriptor]
    
        if let notes = appDelegate!.managedObjectContext!.executeFetchRequest(notesFetchRequest, error: nil) as? [Note] {
            for note in notes {
                //             note.text = "Hello World"
                appDelegate?.saveContext()
                println(note.title)
                println(note.text)
                
                // to delete, type:   appDelegate?managedObjectContext!.deleteObject(note)
            }
            println()
        }
    
    }

}

