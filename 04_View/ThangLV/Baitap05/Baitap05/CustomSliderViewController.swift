//
//  CustomSliderViewController.swift
//  Baitap05
//
//  Created by PCI0008 on 12/13/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class CustomSliderViewController: UIViewController {
    @IBOutlet weak var thumbLabel: UILabel!
    @IBOutlet weak var sliderDragView: UISlider!{
        didSet{
            sliderDragView.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        }
    }
    
    @IBAction func sliderDragHandler(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        thumbLabel.text = "\(currentValue)"
    }
    override func viewDidLoad() {
    }
}

