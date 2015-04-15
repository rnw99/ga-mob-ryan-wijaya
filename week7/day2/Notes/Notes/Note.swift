//
//  Note.swift
//  Notes
//
//  Created by Ryan Wijaya on 9/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import Foundation
import CoreData

// @objc (Note)    // must be added in manually

class Note: NSManagedObject {

    @NSManaged var text: String
    @NSManaged var title: String
    @NSManaged var createdAt: NSDate    // new attributes after subclass is created will need to be added manually
    
}
