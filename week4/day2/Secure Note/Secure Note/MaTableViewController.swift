//
//  MaTableViewController.swift
//  Secure Note
//
//  Created by Ryan Wijaya on 22/03/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class MaTableViewController: UITableViewController {

    var names = [
        // Contact 0
        [
            "firstName" : "John",
            "lastName" : "Appleseed",
            "phone" : "0412 345 678",
            "email" : "john.appleseed@apple.com"
        ],
        
        // Contact 1
        [
            "firstName" : "Tina",
            "lastName" : "McLard",
            "phone" : "0400 100 100",
            "email" : "tina.mclard@yahoo.com"
        ]
    ]
    
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return countElements(names)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        let contact = names[indexPath.row]
        let fullName = contact["firstName"]! + " " + contact["lastName"]!
        
        cell.textLabel!.text = "\(fullName)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    func addNewContact(firstName: String, lastName: String, phone: String, email: String) {
        self.names.append(
            [
                "firstName" : firstName,
                "lastName" : lastName,
                "phone" : phone,
                "email" : email
            ]
        )
        tableView.reloadData()
    }
    
    
    
    // MARK: - Navigation

    @IBAction func unwindFromAddContactScreen(segue: UIStoryboardSegue) {
        let contact = (segue.sourceViewController as CreateContactViewController).renderForm()
        
        self.addNewContact(contact["firstName"]!!, lastName: contact["lastName"]!!, phone: contact["phone"]!!, email: contact["email"]!!)
    }

    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "viewContact") {
            let section = (view as UITableView).indexPathForSelectedRow()!.section
            let row = tableView.indexPathForSelectedRow()!.row
            (segue.destinationViewController as ViewController).contact = names[row]
        
    }
    

}
}