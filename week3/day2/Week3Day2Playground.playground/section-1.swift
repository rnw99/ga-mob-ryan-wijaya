// Playground - noun: a place where people can play

import UIKit

class Player {
    var health = 100
    let name: String
    
    init (name: String) {
        self.name = name
    }
    
    // (Player) -> ()
    func attackOpponent(player: Player) {
        let damage = Int(arc4random_uniform(20))
        
        player.health -= damage
        
        if (damage > 0) {
            println("\(self.name) did \(damage) damage to \(player.name)")
            println("\(player.name)'s health is \(player.health)")
        } else {
            println("\(self.name) tried to attack \(player.name)")
            println("\(player.name) blocked \(self.name)'s attack.")
            println("\(player.name)'s health is \(player.health)")
        }
    }
}

class GoodGuy : Player {
    // (BadGuy) -> ()
    func attack(player: BadGuy) { // friendlyfire off
        super.attackOpponent(player)
    }
}

class BadGuy : Player {
    // (GoodGuy) -> ()
    func attack(player: GoodGuy) { // friendlyfire off
        super.attackOpponent(player)
    }
}

class Pirate : BadGuy {
    override func attack(player: GoodGuy) {
        println("Arrrr")
        super.attack(player)
    }
}

class SuperVillain : BadGuy {
    override func attack(player: GoodGuy) {
        println("*heavy breathing*")
        super.attack(player)
    }
}

class SuperHero : GoodGuy {
    override func attack(player: BadGuy) {
        println("Horay!")
        super.attack(player)
    }
}

class NavySailor : GoodGuy {
    override func attack(player: BadGuy) {
        println("Eeep")
        super.attack(player)
    }
}

let blackBeard = Pirate(name: "Black Beard")
let darthVader = SuperVillain(name: "Darth Vader")
let lukeSkywalker = SuperHero(name: "Luke Skywalker")

blackBeard.attack(lukeSkywalker)



let popeyeTheSailor = NavySailor(name: "Popeye The Sailor")


darthVader.attack(lukeSkywalker)

popeyeTheSailor.attack(darthVader)

darthVader.attack(popeyeTheSailor)












