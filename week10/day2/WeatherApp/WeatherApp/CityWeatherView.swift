//
//  CityWeatherView.swift
//  WeatherApp
//
//  Created by Ryan Wijaya on 30/04/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

@IBDesignable
class CityWeatherView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBInspectable var cityName: String? {
        didSet {
            self.cityLabel.text = self.cityName
        }
    }
    
    @IBInspectable var image: UIImage? {
        get {
            return self.weatherImageView?.image
        }
        
        set {
            self.weatherImageView?.image = newValue
        }
        
        // or just use didSet { newValue = image }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    func loadNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CityWeatherView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        view.frame = self.bounds
        view.autoresizingMask = /* UIViewAutoresizing */ .FlexibleWidth | .FlexibleHeight
        
        addSubview(view)
    }
   
    /*
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: CGRectMake(20, 20, 150, 150))
        path.lineWidth = 4.0
        UIColor.redColor().setStroke()
        path.stroke()
        
        UIColor.blueColor().setFill()
        path.fill()
    }
   */

}
