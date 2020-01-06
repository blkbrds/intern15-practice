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
    @IBOutlet weak var colorInfoLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    var color = Color()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dragRedSlider(_ sender: Any) {
        color.red = CGFloat(redColorSlider.value)
        colorView.backgroundColor = color.synthetic
        colorInfoLabel.text = "Color(R : \(redColorSlider.value), G : \(greenColorSlider.value) , B : \(blueColorSlider.value) )"
    }
    
    @IBAction func dragGreenSlider(_ sender: Any) {
        color.green = CGFloat(greenColorSlider.value)
        colorView.backgroundColor = color.synthetic
        colorInfoLabel.text = "Color(R : \(redColorSlider.value), G : \(greenColorSlider.value) , B : \(blueColorSlider.value) )"
    }
    
    @IBAction func dragBlueSlider(_ sender: Any) {
        color.blue = CGFloat(blueColorSlider.value)
        colorView.backgroundColor = color.synthetic
        colorInfoLabel.text = "Color( R : \(redColorSlider.value), G : \(greenColorSlider.value) , B : \(blueColorSlider.value) )"
    }
}
