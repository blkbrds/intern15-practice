//
//  CustomSliderViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/8/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//
import UIKit

final class CustomSliderViewController: UIViewController {
    @IBOutlet weak var sliderBarView: UIView!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var colorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderBarView.layer.borderWidth = 1
        sliderBarView.layer.cornerRadius = 20
        sliderBarView.layer.borderColor = UIColor.black.cgColor

        sliderLabel.text = "0 %"
        sliderLabel.layer.cornerRadius = 20
        sliderLabel.clipsToBounds = true
        sliderLabel.center = CGPoint(x: sliderBarView.frame.midX, y: sliderBarView.frame.maxY)

        colorView.layer.cornerRadius = 20
        colorView.frame = CGRect(x: sliderBarView.frame.maxX, y: sliderBarView.frame.maxY, width: 0, height: 0)

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(CustomSliderViewController.handlePan(sender:)))
        sliderLabel.addGestureRecognizer(panGestureRecognizer)
    }

    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sliderLabel.center.y + translation.y >= sliderBarView.frame.minY && sliderLabel.center.y + translation.y <= sliderBarView.frame.maxY {
            sliderLabel.center = CGPoint(x: sliderLabel.center.x, y: sliderLabel.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            colorView.frame = CGRect(x: sliderBarView.frame.minX, y: sliderLabel.center.y, width: sliderBarView.frame.width, height: sliderBarView.frame.maxY - sliderLabel.center.y)
            sliderLabel.text = "\(Int((sliderBarView.frame.maxY - sliderLabel.center.y) / (sliderBarView.frame.maxY - sliderBarView.frame.minY) * 100)) %"
        } else if sliderLabel.center.y + translation.y < sliderBarView.frame.minY {
            sliderLabel.text = "100 %"
        }
    }
}
