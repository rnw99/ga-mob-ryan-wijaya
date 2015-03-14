//
//  ViewController.swift
//  GoodVSBad
//
//  Created by Jack Watson-Hamblin on 12/03/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let superHero = SuperHero(name: "Superman")
    let superVillain = SuperVillain(name: "Batman")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func superHeroAttacks(sender: AnyObject) {
        superHero.attack(superVillain)
        checkForEndGame()
    }

    @IBAction func superVillainAttacks(sender: AnyObject) {
        superVillain.attack(superHero)
        checkForEndGame()
    }
    
    func checkForEndGame() {
        NSLog("villain health \(superVillain.health)")
        NSLog("hero health \(superHero.health)")
        
        if (superHero.health <= 0 || superVillain.health <= 0) {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}

