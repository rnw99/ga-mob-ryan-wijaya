//
//  TableViewController.swift
//  Secure Note
//
//  Created by Ryan Wijaya on 16/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts

class TableViewController: PFQueryTableViewController {

    @IBAction func signOut(sender: UIBarButtonItem) {
  
        PFUser.logOut()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("SignInNavigationController") as! UIViewController
            self.presentViewController(vc, animated: true, completion: nil)

    }
    
    @IBAction func add(sender: UIBarButtonItem) {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("TableViewToDetailView", sender: self)
        }
        
    }
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Notes"
        self.textKey = "titleText"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }

    // If you have pagination enabled (true), then you also need to set the number of rows to fetch from the server
    // self.objectsPerPage = 20
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        
        var query = PFQuery(className: "Notes")
        query.orderByDescending("updatedAt")
        
        return query
    }
    // You could further restrict the returned data set
    // i.e. query.whereKey("currencyCode", equalTo: "EUR")
    // Maybe consider adding a search box to the table view and use the values entered within your query
    
    
    // normally it would look like this without Parse:
    // override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    // However, with Parse's PFTableViewCell it looks like as follows:
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let titleText = object?["titleText"] as? String {
            cell?.textLabel?.text = titleText
        }
        
        return cell
        
    }
    
    // To add a "row delete" capability, we need to add 2 more methods to our controller code.
    // The first method will signal to the table that EDITING ROW is enabled.
    // The second method will DETAIL just WHAT TO DO when the user edits a row - in our case delete the row.
    
    // This is the FIRST method - to enable EDITING ROW.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // return "false" if you do not want the specified item to be editable.
        return true
    }
    
    // This is the SECOND method - to DETAIL WHAT TO DO
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let objectToDelete = objects?[indexPath.row] as! PFObject
            objectToDelete.deleteInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // Force a reload of the table - fetching fresh data from Parse platform
                    self.loadObjects()
                } else {
                    // There was a problem check error.description
                    println(error?.description)
                }
            }
        }
    }

    /*
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // Refresh the table to ensure any data changes are displayed
        loadObjects()
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as! DetailViewController
        
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects?[row] as? PFObject
            // without Parse, it would normally look like:
            // detailScene.currentObject = objectAtIndexPath(indexPath)
        }
    }
 

}
