//
//  SliderBackgroudColorViewController.swift
//  BaiTapView
//
//  Created by TranVanTien on 11/14/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class SliderBackgroudColorViewController: UIViewController {

    @IBOutlet private weak var textColorLabel: UILabel!
    @IBOutlet private weak var colorViewLabel: UILabel!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!

    @IBOutlet private weak var redSliderValueLabel: UILabel!
    @IBOutlet private weak var blueSliderValueLabel: UILabel!
    @IBOutlet private weak var greenSliderValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        colorViewLabel.clipsToBounds = true
        colorViewLabel.layer.borderWidth = 1
        colorViewLabel.layer.cornerRadius = 30
        colorViewLabel.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction private func sliderAction(_ sender: Any) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)

        textColorLabel.text = "Color(R: \(Int(red)), G: \(Int(green)), B: \(Int(blue)))"

        redSliderValueLabel.text = String(Int(red))
        greenSliderValueLabel.text = String(Int(green))
        blueSliderValueLabel.text = String(Int(blue))

        colorViewLabel.backgroundColor = UIColor(displayP3Red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

