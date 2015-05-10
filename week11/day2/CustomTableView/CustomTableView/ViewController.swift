//
//  ViewController.swift
//  CustomTableView
//
//  Created by Ryan Wijaya on 7/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let data = [
        ["name" : "Jack Watson-Hamblin", "bio" : "iOS Teacher", "image" : "Jack" ],
        ["name" : "Phil Wilson", "bio" : "Also an iOS Teacher", "image" : "Phil"]
    ]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UITableViewCell {
        
        let headerView = tableView.dequeueReusableCellWithIdentifier("headerCell") as! UITableViewCell
        
        headerView.layer.borderWidth = 1.0
        
        return headerView
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("profileCell") as! ProfileTableViewCell
        
        let person = data[indexPath.row]
        
        if let personImage = person["image"] {
            cell.profileImageView.image = UIImage(named: personImage)
        }
        
        if let personName = person["name"] {
            cell.nameLabel.text = personName
        }
        
        if let personBio = person["bio"] {
            cell.bioLabel.text = personBio
        }
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.yellowColor()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

