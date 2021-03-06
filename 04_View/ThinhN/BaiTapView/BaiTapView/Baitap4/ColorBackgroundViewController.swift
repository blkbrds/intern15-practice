//
//  ColorBackgroundViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/22/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class ColorBackgroundViewController: UIViewController {
    
    @IBOutlet private weak var textColorLabel: UILabel!
    @IBOutlet private weak var colorViewLabel: UILabel!
    @IBOutlet private weak var redSliderValueLabel: UILabel!
    @IBOutlet private weak var greenSliderValueLabel: UILabel!
    @IBOutlet private weak var blueSliderValueLabel: UILabel!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        colorViewLabel.layer.borderColor = UIColor.systemBlue.cgColor
        colorViewLabel.layer.borderWidth = 1
        colorViewLabel.clipsToBounds = true
        colorViewLabel.layer.cornerRadius = 50
    }
    @IBAction private func sliderAction(_ sender: Any) {
        colorViewLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        textColorLabel.text = "Color( R: \(Int(redSlider.value)), G: \(Int(greenSlider.value)), B: \(Int(blueSlider.value)))"
    }
}
    
