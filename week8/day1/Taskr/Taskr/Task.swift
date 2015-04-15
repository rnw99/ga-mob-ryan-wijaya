//
//  Task.swift
//  Taskr
//
//  Created by Ryan Wijaya on 14/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var createdAt: NSDate

}
