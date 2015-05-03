//
//  ViewController.swift
//  Bloggr
//
//  Created by Ryan Wijaya on 21/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create new object to work with
        var blogPost = PFObject(className: "BlogPost")
        
        // set properties to have values
        blogPost["title"] = "Hello World"
        blogPost["subtitle"] = "This is the subtitle"
        blogPost["content"] = "Welcome to my blog Swifters"
        
        // save to Parse some time later
        blogPost.saveInBackground()
        
        // makes a query for "BlogPost" objects
        var blogPostQuery = PFQuery(className: "BlogPost")
        
        // limits the query to only posts created before now
        blogPostQuery.whereKey("createdAt", lessThanOrEqualTo: NSDate())
        
        // actually runs the query and gives us them back to do something with
        blogPostQuery.findObjectsInBackgroundWithBlock() { objects, error in
           
            // check for existence of returned objects
            if let results = objects {
                
                // loop through all objects from Parse
                for post in objects {
                    
                    // print out the title of each post
                    println(post["title"]!)
                    
                    // print out the created at timestamp of each post
                    println(post.createdAt)
                
                    // set title = "Goodbye"
                    post.setValue("Goodbye", forKey: "title")
                    
                    // upload the changes to Parse
                    post.saveInBackground()
                }
        }
        
        // get the first object matching the query
        blogPostQuery.getFirstObjectInBackgroundWithBlock() { object, error in
            
            // check an object is there
            if let blogPost = object {
            
            // delete the object
                blogPost.deleteInBackground()
            }
        }
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

