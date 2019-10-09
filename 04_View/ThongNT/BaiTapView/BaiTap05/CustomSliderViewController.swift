//
//  CustomSliderViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/8/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class CustomSliderViewController: UIViewController {
    @IBOutlet weak var sliderBar: UIView!
    @IBOutlet weak var sliderButton: UILabel!
    // view that change color follow the button
    @IBOutlet var colorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderBar.layer.borderWidth = 1
        sliderBar.layer.cornerRadius = 20
        sliderBar.layer.borderColor = UIColor.black.cgColor

        sliderButton.layer.cornerRadius = 20
        sliderButton.clipsToBounds = true

        colorView.layer.cornerRadius = 20

        sliderButton.center = CGPoint(x: sliderBar.frame.midX, y: sliderBar.frame.maxY)
        colorView.frame = CGRect(x: sliderBar.frame.maxX, y: sliderBar.frame.maxY, width: 0, height: 0)

        sliderButton.text = "0 %"

        let pan = UIPanGestureRecognizer(target: self, action: #selector(CustomSliderViewController.handlePan(sender:)))
        sliderButton.addGestureRecognizer(pan)

    }
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sliderButton.center.y + translation.y >= sliderBar.frame.minY && sliderButton.center.y + translation.y <= sliderBar.frame.maxY {
            sliderButton.center = CGPoint(x: sliderButton.center.x, y: sliderButton.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            colorView.frame = CGRect(x: sliderBar.frame.minX, y: sliderButton.center.y, width: sliderBar.frame.width, height: sliderBar.frame.maxY - sliderButton.center.y)
            sliderButton.text = "\(Int((sliderBar.frame.maxY - sliderButton.center.y) / (sliderBar.frame.maxY - sliderBar.frame.minY) * 100)) %"
        } else if sliderButton.center.y + translation.y < sliderBar.frame.minY {
            sliderButton.text = "100 %"
            
        }
    }
}
