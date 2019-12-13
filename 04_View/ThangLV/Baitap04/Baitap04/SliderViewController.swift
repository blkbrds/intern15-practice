//
//  SliderViewController.swift
//  Baitap04
//
//  Created by Chinh Le on 12/13/19.
//  Copyright © 2019 Thang Le. All rights reserved.
//

import UIKit

struct Color {
    var red: CGFloat = 128
    var green: CGFloat = 128
    var blue: CGFloat = 128
    var synthetic: UIColor {
        return UIColor(displayP3Red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

final class SliderViewController: UIViewController {

    
    @IBOutlet weak var infoColorLabel: UILabel!
    @IBOutlet weak var viewNeedToChangeColor: UIView!
    @IBOutlet weak var redSliderChangeColor: UISlider!
    @IBOutlet weak var greenSliderChangeColor: UISlider!
    @IBOutlet weak var blueSliderChangeColor: UISlider!
    
    var color = Color()
    
    
    @IBAction func redSlider(_ sender: Any) {
        color.red = CGFloat(redSliderChangeColor.value)
        viewNeedToChangeColor.backgroundColor = color.synthetic
        infoColorLabel.text = "Color ( R : \(redSliderChangeColor.value), G : \(greenSliderChangeColor.value) , B : \(blueSliderChangeColor.value) )"
    }
    
    
    @IBAction func greenSlider(_ sender: Any) {
        color.green = CGFloat(greenSliderChangeColor.value)
        viewNeedToChangeColor.backgroundColor = color.synthetic
        infoColorLabel.text = "Color ( R : \(redSliderChangeColor.value), G : \(greenSliderChangeColor.value) , B : \(blueSliderChangeColor.value) )"
    }
    
    
    @IBAction func blueSlider(_ sender: Any) {
        color.blue = CGFloat(blueSliderChangeColor.value)
        viewNeedToChangeColor.backgroundColor = color.synthetic
        infoColorLabel.text = "Color ( R : \(redSliderChangeColor.value), G : \(greenSliderChangeColor.value) , B : \(blueSliderChangeColor.value) )"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
