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

    var redPoint: CGFloat = 100 {
        didSet {
            changeValueColor()
        }
    }
    var greenPoint: CGFloat = 100 {
        didSet {
            changeValueColor()
        }
    }
    var bluePoint: CGFloat = 100 {
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
        redSlider.value = Float(redPoint)
        greenSlider.value = Float(greenPoint)
        blueSlider.value = Float(bluePoint)
        changeValueColor()
    }

    @IBAction func changeValueColor(_ sender: Any) {
        redPoint = CGFloat(redSlider.value)
    }

    @IBAction func changeGreenValueColor(_ sender: Any) {
        greenPoint = CGFloat(greenSlider.value)
    }

    @IBAction func changeBlueValueColor(_ sender: Any) {
        bluePoint = CGFloat(blueSlider.value)
    }

    func changeValueColor() {
        boardColorLabel.backgroundColor = UIColor(displayP3Red: redPoint / 255, green: greenPoint / 255, blue: bluePoint / 255, alpha: 1)
        inForColorLabel.text = "CoLor( R: \(Int(redPoint)), G: \(Int(greenPoint)), B: \(Int(bluePoint)))"
    }
}

