// Playground - noun: a place where people can play

import UIKit

arc4random_uniform(20)

struct BlogPost {
 // same as a Class except it gets copied instead of it gets referenced
    let title: String
    let content: String
    
    func print() {
        println("\(title): \(content)")
    }
}

class Animal {
    let storedName: String
    let storedBreed: String
    
    init (name: String, breed: String) {
        self.storedName = name
        self.storedBreed = breed
    }
    
    func speak() -> String {
        return "\(self.storedName) spoke"
    }
}

class Cat : Animal {
    override func speak() -> String {
        return "Purrrr"
    }
}

class Dog : Animal {
    override func speak() -> String {
        return "\(super.speak()) Bark bark!"
    }
}

let trixyTheCat = Cat(name: "Trixy", breed: "Persian")
let fluffyTheDog = Dog(name: "Fluffy", breed: "Jack Russell")

trixyTheCat.speak()
fluffyTheDog.speak()
