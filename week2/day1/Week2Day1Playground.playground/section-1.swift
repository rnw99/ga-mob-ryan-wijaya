// Playground - noun: a place where people can play

import UIKit

var name : String = "Ryan"

var age : Int = 28

println("Hello \(name), you are \(age) years old!")










if (name == "Ryan") {    // one = assignment
    println("Hello Master")  // two == equality
} else {
    println("Hello Stranger")
}


if (age >= 13) {
    println("Your are not a child")
} else {
    println("Hi Kiddo")
}


if (age < 13 && name == "Ryan") {   // and uses && and both values have to be met
    println("Your are not a child")  // or uses ||
} else {
    println("Hi Kiddo")
}


age >= 13

1 + 1


if (age >= 21) {
    println("Adult")
} else if (age >= 18) {
    println("Young Adult")
} else if (age >= 13){
    println("Teenager")
} else {
    println("Child")
}


var count = 1

while (count <= 10) {   // while loop, continue until condition is false
    println(count)
    count += 1
}


// for loop: initial value, condition, what should be done at the end of each value


for (var count = 1; count <= 10; count += 1) {
    println(count)
}

for (var i = 1; i <= 10; i++) {
    println(i)
}






