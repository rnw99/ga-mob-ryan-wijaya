// Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

/*
func dataLoaded(data: NSData, response: NSURLResponse, error: NSError) -> Void {
    
}

func add(x: Int, y: Int) -> Int {
    return x + y
}

func calculate(x: Int, y: Int, calculation: (Int, Int) -> (Int)) -> Int {
    let calMethod = calculation
    
    return calculation(x, y)
}

calculate(1, 2, add)

calculate(1, 2) { x, y in x + y }
*/


let url = NSURL(string: "http://blog.motioninmotion.tv/")

var session = NSURLSession.sharedSession()
// to manage all ingoing and outgoing requests to the internet

var request: NSURLSessionDataTask = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
    
    println("complete")
        let dataAsString = NSString(data: data, encoding: 1)
    
        println(dataAsString)
})

println("hello")
request.resume()
println("goodbye")


var str = "Hello, playground"


var request2: NSURLSessionDataTask = session.dataTaskWithURL(url!) { (data, response, error) -> Void in
    
    println("complete")
    let dataAsString = NSString(data: data, encoding: 1)
    
    println(dataAsString)
}

