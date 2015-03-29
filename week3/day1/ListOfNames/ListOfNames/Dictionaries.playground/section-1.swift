// Playground - noun: a place where people can play

import UIKit

let names = [
          // 0        1           2
    "A": ["Andy",   "Amy",      "Andrew"],
    "B": ["Bob",    "Billy"],
    "C": ["Ciara",  "Chris",    "Charlie"]

]

countElements(names)

// indexPath.section = 0

let nameKey = names.keys.array.reverse()[0]
names[nameKey][0]

