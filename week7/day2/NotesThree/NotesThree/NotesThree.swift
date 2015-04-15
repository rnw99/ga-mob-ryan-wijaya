//
//  NotesThree.swift
//  NotesThree
//
//  Created by Ryan Wijaya on 15/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import Foundation
import CoreData

class NotesThree: NSManagedObject {

    @NSManaged var note: String
    @NSManaged var createdAt: NSDate

}
