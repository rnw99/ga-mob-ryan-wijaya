//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ryan Wijaya on 30/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityWeatherView: CityWeatherView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityWeatherView!.cityLabel.text = "Melbourne"
        self.cityWeatherView!.image = UIImage(named: "LightRain")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

