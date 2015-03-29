//
//  MyTableViewController.swift
//  ListOfNames
//
//  Created by Ryan Wijaya on 17/03/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

//    let names = [
//        ["Andy", "Amy", "Andrew"],
//        ["Bob", "Billy"],
//        ["Ciara", "Chris", "Charlie"]
//    ]
    
    
    // Dictionary
//    let names = [
//        "A": ["Andy",   "Amy",  "Andrew"],
//        "B": ["Bob",    "Billy"],
//        "C": ["Ciara",  "Chris", "Charlie"],
//    ]
    
// sections["A"] // "Amy"
    
    var names = [
        // Contact 0
        [
            "firstName" : "Jack",
            "lastName" : "Watson-Hamblin",
            "phone" : "0422 222 222",
            "email" : "info@fluffyjack.com"
        ],
        
        // Contact 1
        [
            "firstName" : "Phil",
            "lastName" : "Wilson",
            "phone" : "0422 222 223",
            "email" : "info@phil.com"
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

    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("Tapped - Section: \(indexPath.section); Row: \(indexPath.row);")
    }
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1 // countElements(names)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        /* let nameKey = names.keys.array.reverse()[section] */
        return countElements(names/*[nameKey]!*/)
    }

 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // load the template - prototype cell
        var cell: UITableViewCell
        
        if  (indexPath.section % 2 == 0) {
            cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath) as UITableViewCell
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("subtitleCell", forIndexPath: indexPath) as UITableViewCell
        }
        // Configure the cell...
        
        // find and insert the data into the template
        // let nameKey = names.keys.array.reverse()[indexPath.section]
        let contact = names[indexPath.row]
        let name = contact["firstName"]! + " " + contact["lastName"]!
        /*let name = names/*[nameKey]!*/[indexPath.row]*/
        cell.textLabel!.text = "\(name) - Section: \(indexPath.section); Row: \(indexPath.row);"
        
        if (indexPath.section % 2 != 0) {
            cell.detailTextLabel!.text = "Hello!"
        }
        

        // give the cell back to the table view
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
    
    // must be put in the DESTINATION (NOT ORIGIN)swift class file
    @IBAction func unwindFromAddContactScreen(segue: UIStoryboardSegue) {
        //(segue.sourceViewController as AddContactViewController).renderForm()
        let contact = (segue.sourceViewController as InputDataViewController).renderForm()
//        let firstName = ""
//        let lastName = ""
//        let phone = ""
//        let email = ""
        
        self.addNewContact(contact["firstName"]!!, lastName: contact["lastName"]!!, phone: contact["phone"]!!, email: contact["email"]!!)
        // (firstName, lastName: lastName, phone: phone, email: email)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
   // }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showDetailScreen") {
            let section = (view as UITableView).indexPathForSelectedRow()!.section
            let row = tableView.indexPathForSelectedRow()!.row
            /* let nameKey = names.keys.array.reverse()[section] */
            (segue.destinationViewController as ViewController).contact = names/*[nameKey]!*/[row]
        }
    }

}
