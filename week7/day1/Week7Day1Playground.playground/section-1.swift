// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

@objc protocol Vehicle {
    required func drive() -> Bool
    // but can't write the method / function in the protocol
    optional func startEngine() -> Bool
}

class Sedan : Vehicle {
    func drive() -> Bool {
        return true
    }
}

class BatMobile : Vehicle {
    func drive() -> Bool {
        return true
    }
}

class Commuter {
    func travel(modeOfTravel: Vehicle) {
        modeOfTravel.drive()
    }
}

let c = Commuter()
let s = Sedan()
c.travel(s)

