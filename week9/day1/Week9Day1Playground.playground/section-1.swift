// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var todos = [
    [
        "ID": "1",
        "title": "Learn Swift",
        "notes": "Come to class and do homework",
        "priority": "High"
    ],
    [
        "ID": "2",
        "title": "Master Auto Layout",
        "notes": "Practise practise practise",
        "priority": "High"
    ],
    [
        "ID": "3",
        "title": "Check out the Apple Watch",
        "notes": "Pay the Apple Store a visit",
        "priority": "Low"
    ],
    [
        "ID": "4",
        "title": "Learn Parse integration",
        "notes": "Check out tutorials on YouTube",
        "priority": "Medium"
    ]
]

println(todos)

todos += [["ID": "5", "title": "Pay Bills", "notes": "Do it", "priority": "high"]]

todos.extend([["ID": "7", "title": "Jog 5 miles", "notes": "Just do it", "priority": "super low"]])

todos.insert(["ID": "6", "title": "Kill Batman", "notes": "Only Superman can", "priority": "Medium"], atIndex: 5)

// todos.splice([


// CREATE: Add a dictionary to the array
// use += as above

// UPDATE: Manipulate one
todos[0]["title"] = "Boo!"


// DELETE: Remove an item
todos.removeAtIndex(0)
//todos.removeLast()
//todos.removeAll(keepCapacity: false)


// READ: Loop through them all
for todo in todos {
    if let title = todo["title"] {
        println("\(title)")
    }
    
    if let notes = todo["notes"] {
        println("\(notes)")
    }
}




