//
//  SliderViewController.swift
//  baitap4.4
//
//  Created by user on 11/14/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class SliderViewController: UIViewController {

    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var boardColorLabel: UILabel!
    @IBOutlet private weak var inForColorLabel: UILabel!

    var redColor: CGFloat = 100 {
        didSet {
            changeValueColor()
        }
    }
    var greenColor: CGFloat = 100 {
        didSet {
            changeValueColor()
        }
    }
    var blueColor: CGFloat = 100 {
        didSet {
            changeValueColor()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        changeValueColor()
        boardColorLabel.clipsToBounds = true
        boardColorLabel.layer.cornerRadius = 20
        redSlider.value = Float(greenColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        changeValueColor()
    }

    @IBAction func changeValueColor(_ sender: Any) {
        redColor = CGFloat(redSlider.value)
    }

    @IBAction func changeGreenValueColor(_ sender: Any) {
        greenColor = CGFloat(greenSlider.value)
    }

    @IBAction func changeBlueValueColor(_ sender: Any) {
        blueColor = CGFloat(blueSlider.value)
    }

    func changeValueColor() {
        boardColorLabel.backgroundColor = UIColor(displayP3Red: redColor / 255, green: greenColor / 255, blue: blueColor / 255, alpha: 1)
        inForColorLabel.text = "CoLor( R: \(Int(redColor)), G: \(Int(greenColor)), B: \(Int(blueColor)))"
    }
}

