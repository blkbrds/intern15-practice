//
//  SliderBackgroudColorViewController.swift
//  BaiTap04
//
//  Created by PCI0002 on 11/12/19.
//  Copyright © 2019 PCI0002. All rights reserved.
//

import UIKit

class SliderBackgroudColorViewController: UIViewController {

    @IBOutlet weak var textColorLabel: UILabel!
    @IBOutlet weak var colorViewLabel: UILabel!
    @IBOutlet weak var redSider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!


    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var blueSliderValue: UILabel!
    @IBOutlet weak var greenSliderValue: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        colorViewLabel.clipsToBounds = true
        colorViewLabel.layer.borderWidth = 1
        colorViewLabel.layer.cornerRadius = 30
        colorViewLabel.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func sliderAction(_ sender: Any) {
        let red = CGFloat(redSider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)

        textColorLabel.text = "Color(R: \(Int(red)), G: \(Int(green)), B: \(Int(blue)))"

        redSliderValue.text = String(Int(red))
        greenSliderValue.text = String(Int(green))
        blueSliderValue.text = String(Int(blue))

        self.colorViewLabel.backgroundColor = UIColor(displayP3Red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
