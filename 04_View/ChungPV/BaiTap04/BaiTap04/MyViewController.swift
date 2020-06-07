//
//  MyViewController.swift
//  BaiTap04
//
//  Created by MBA0168 on 6/8/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var displayColorLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func sliderAction(_ sender: Any) {
        // add min, max
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        
        // color
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        
        // show color
        colorView.backgroundColor = UIColor(red: redColor/255.0, green: greenColor/255.0, blue: blueColor/255.0, alpha: 1)
        
        
        // value color
        let redValue = redSlider.value
        let greenValue = greenSlider.value
        let blueValue = blueSlider.value
        displayColorLabel.numberOfLines = 2
        displayColorLabel.lineBreakMode = .byWordWrapping
        displayColorLabel.text = "Color (R: \(redValue),G: \(greenValue),B: \(blueValue)"
    }

}
