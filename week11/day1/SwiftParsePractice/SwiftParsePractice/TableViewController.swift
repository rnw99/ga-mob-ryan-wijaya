//
//  ViewController.swift
//  SwiftParsePractice
//
//  Created by Ryan Wijaya on 7/05/2015.
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
        
        let vc = storyboard.instantiateViewControllerWithIdentifier("SignUpInViewController") as! UIViewController
        
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
        self.parseClassName = "Countries"
        self.textKey = "nameEnglish"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    // If you have pagination enabled (true), then you also need to set the number of rows to fetch from the server
    // self.objectsPerPage = 20
    
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "Countries")
        query.orderByDescending("updatedAt")
        return query
    }
    // You could further restrict the returned data set
    // i.e. query.whereKey("currencyCode:, equalTo:"EUR")
    // Maybe consider adding a search box to the table view and use the values entered within your query
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let nameEnglish = object?["nameEnglish"] as? String {
            cell?.textLabel?.text = nameEnglish
        }
        
        if let capital = object?["capital"] as? String {
            cell?.detailTextLabel?.text = capital
        }
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // Refresh the table to ensure any data changes are displayed
        tableView.reloadData()
        
        // DID NOT CHANGE THE ORDER THOUGH BASED ON DESCENDING UPDATED AT ??????????
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as! DetailViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects?[row] as? PFObject
            // detailScene.currentObject = objectAtIndexPath(indexPath)
        }
    }
    

}
