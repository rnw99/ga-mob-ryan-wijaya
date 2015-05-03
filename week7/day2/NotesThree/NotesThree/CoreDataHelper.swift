//
//  CoreDataHelper.swift
//  NotesThree
//
//  Created by Ryan Wijaya on 15/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    
    var managedObjectContext: NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        return appDelegate!.managedObjectContext!
    }
    
    func saveContext() {
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        return appDelegate!.saveContext()
    }
    
}

// TERMS IN NETWORKING:
// create
// read
// update
// delete

// TERMS IN NETWORKING:
// post
// get
// put (update)
// delete