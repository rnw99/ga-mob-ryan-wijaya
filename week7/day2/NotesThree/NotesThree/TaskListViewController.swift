//
//  ViewController.swift
//  NotesThree
//
//  Created by Ryan Wijaya on 15/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import CoreData

class TaskListViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let coreDataHelper = CoreDataHelper()
    
    var fetchedResultsController: NSFetchedResultsController {
        if self._fetchedResultsController != nil {
            return self._fetchedResultsController!
        }

    let fetchRequest = NSFetchRequest(entityName: "NotesEntity")
    let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
        
    self._fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.coreDataHelper.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
    self._fetchedResultsController?.delegate = self
    self._fetchedResultsController?.performFetch(nil)
        
    return self._fetchedResultsController!
    }
    
    var _fetchedResultsController : NSFetchedResultsController?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNote(sender: UIBarButtonItem) {
        // opens AddNote View Controller
        // adds a new note attribute in CoreData
        
        let note = NSEntityDescription.insertNewObjectForEntityForName("NotesEntity", inManagedObjectContext: self.coreDataHelper.managedObjectContext) as NotesThree
        note.note = "Hello World"
        note.createdAt = NSDate()
        
        self.coreDataHelper.saveContext()
        
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = self.fetchedResultsController.sections {
            return (sections[section] as NSFetchedResultsSectionInfo).numberOfObjects
        }
        return 0
        //        return self.fetchedResultsController.sections![section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell")! as UITableViewCell
        
        self.configureCell(cell, indexPath: indexPath)
        
        // Step 4: Return the configured cell
        return cell
        
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        // Step 2: Retrieve the data
        let note = self.fetchedResultsController.objectAtIndexPath(indexPath) as NotesThree
        
        // Step 3: Configure the cell
        cell.textLabel!.text = note.note
    }
    
    
    
    /* called first
    begins update to `UITableView`
    ensures all updates are animated simultaneously */
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    /* called:
    - when a new model is created
    - when an existing model is updated
    - when an existing model is deleted */
    func controller(controller: NSFetchedResultsController,
        didChangeObject object: AnyObject,
        atIndexPath indexPath: NSIndexPath,
        forChangeType type: NSFetchedResultsChangeType,
        newIndexPath: NSIndexPath) {
            switch type {
            case .Insert:
                self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            case .Update:
                let cell = self.tableView.cellForRowAtIndexPath(indexPath)
                self.configureCell(cell!, indexPath: indexPath)
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            case .Move:
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            case .Delete:
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            default:
                return
            }
    }
    
    /* called last
    tells `UITableView` updates are complete */
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.endUpdates()
    }
    
    

}

