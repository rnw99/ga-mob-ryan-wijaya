//
//  CoreDataHelper.swift
//  Taskr
//
//  Created by Ryan Wijaya on 14/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    var managedObjectContext: NSManagedObjectContext {
        let appDelegate =  UIApplication.sharedApplication().delegate as? AppDelegate
        return appDelegate!.managedObjectContext!
    }
    
    func saveContext() {
        let appDelegate =  UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.saveContext()
    }
    
    func addDummyData() {
        // create read delete, create loop delete
        
        // read out the data
        let fetchRequest = NSFetchRequest(entityName: "TaskEntity")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // use execute fetch request thru managedObjectContext to read data
        let tasks = self.managedObjectContext.executeFetchRequest(fetchRequest, error: nil) as [Task]
        
        // for every single task in the task array
        
        // loop the data and delete it
        for task in tasks {
            self.managedObjectContext.deleteObject(task)
        }
        
        // the content
        let taskStrings = [
            "Do the dishes",
            "Hang out the washing",
            "Fold clothes",
            "Master Swift"
        ]
        
        // to create a bunch of tasks
        
        // creating the content
        for taskString in taskStrings {
            let newTask = NSEntityDescription.insertNewObjectForEntityForName("TaskEntity", inManagedObjectContext: self.managedObjectContext) as Task
            newTask.title = taskString
        }
        
        // saving the content to disk
        self.saveContext()
        
    }
    
}