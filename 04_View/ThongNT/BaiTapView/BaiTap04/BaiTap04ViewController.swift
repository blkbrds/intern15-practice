//
//  BaiTap04ViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/8/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
struct Color {
    var red: CGFloat = 128
    var green: CGFloat = 128
    var blue: CGFloat = 128
    var color: UIColor {
        return UIColor(displayP3Red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

class BaiTap04ViewController: UIViewController {
    @IBOutlet weak var colorBoard: UIView!
    @IBOutlet weak var showInforLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // lam cong goc cho view
        colorBoard.layer.cornerRadius = 20
        showInforLabel.text = "Color ( R : 128 , G : 128 , B : 128 )"

    }
    var color = Color()
    @IBAction func redSlider(_ sender: Any) {
        color.red = CGFloat(redSlider.value)
        colorBoard.backgroundColor = color.color
        showInforLabel.text = "Color ( R : \(Int(color.red)) , G : \(Int(color.green)) , B :\(Int(color.blue)) )"
    }
    @IBAction func greenSlider(_ sender: Any) {
        color.green = CGFloat(greenSlider.value)
        colorBoard.backgroundColor = color.color
        showInforLabel.text = "Color ( R : \(Int(color.red)) , G : \(Int(color.green)) , B :\(Int(color.blue)) )"
    }
    @IBAction func blueSlider(_ sender: Any) {
        color.blue = CGFloat(blueSlider.value)
        colorBoard.backgroundColor = color.color
        showInforLabel.text = "Color ( R : \(Int(color.red)) , G : \(Int(color.green)) , B :\(Int(color.blue)) )"
    }

}
