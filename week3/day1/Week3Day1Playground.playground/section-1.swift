// Playground - noun: a place where people can play

import UIKit

// TODO: Create a dog class
class Dog {
    
    // TODO: Give it properties you can think
    let storedName: String
    let storedBreed: String
    
    init(name: String, breed: String) {
        self.storedName = name
        self.storedBreed = breed
    }
    
    // TODO: Give it some actions / methods
    
    func speak(text: String) {
        var textToSpeak = "Blah Blah"
        
        println("\(self.storedName) says \(text)")
    }
    
    
}

let fluffyTheDog = Dog(name: "Fluffy", breed: "Jack Russell")
fluffyTheDog.storedName
fluffyTheDog.storedBreed
// label.text

let rexTheDog = Dog(name: "Rex", breed: "German Sheperd")
rexTheDog.storedName
rexTheDog.storedBreed


// TODO: Create a cat class
class Cat {
    // TODO: Give it properties you can think
    let storedName: String
    let storedBreed: String
    
    init(name: String, breed: String) {
        self.storedName = name
        self.storedBreed = breed
    }

    
    // TODO: Give it some actions / methods
    
    
}

// dog = Dog("Fluffy")
// dog2 = Dog("Rex")
// cat = Cat("Trixy")
// cat2 = Cat("Sox")

// dog.doesLke(dog) -> true
// cat.doesLike(cat) -> true
// dog.doesLike(cat) -> false
// cat.doesLike(dog) -> false

/* class Dog {
// to create a class of dog
    let name: String
    // to give the dog a name
    
    let breed: String
    // to define the breed of the dog
    
    var clean: Bool
    // to define whether the dog is clean or dirty
    
    var puppies: [Dog]
    // to list the dog's offsprings
    
    var size: String
    // to define the size of the dog - small, medium, large
    
    init() {
        name = "Angie"
        breed = "Shih-Tzu"
        clean = true
        puppies = []
        size = "Small"
    }
    
    func bark() -> String {
        return "yap"
    }
    
    
} */
