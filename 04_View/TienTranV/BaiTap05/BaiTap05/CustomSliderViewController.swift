//
//  CustomSliderViewController.swift
//  BaiTap05
//
//  Created by PCI0002 on 11/13/19.
//  Copyright © 2019 PCI0002. All rights reserved.
//

import UIKit

class CustomSliderViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var sliderBarView: UIView!
    @IBOutlet weak var thumbSliderLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

    }

    func setUpView() {
        setUpThumbSliderLabel()
        setUpViewSlider(view: colorView)
        setUpViewSlider(view: sliderBarView)
        if view.tag == 1 {
            view.frame = CGRect(x: 0, y: 0, width: self.sliderBarView.frame.width, height: sliderBarView.frame.midY)
        }
    }

    func setUpViewSlider(view: UIView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 27
        view.layer.borderColor = UIColor.green.cgColor

    }

    func setUpThumbSliderLabel() {
        thumbSliderLabel.text = "50%"
        thumbSliderLabel.clipsToBounds = true
        thumbSliderLabel.layer.cornerRadius = 40
        thumbSliderLabel.layer.borderWidth = 2
        thumbSliderLabel.layer.borderColor = UIColor.red.cgColor

        thumbSliderLabel.center = CGPoint(x: sliderBarView.frame.midX, y: sliderBarView.frame.midY)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            if position.x >= thumbSliderLabel.frame.minX,
                position.x <= thumbSliderLabel.frame.maxX,
                position.y >= thumbSliderLabel.frame.minY,
                position.y <= thumbSliderLabel.frame.maxY,
                position.y >= sliderBarView.frame.minY,
                position.y <= sliderBarView.frame.maxY {

                thumbSliderLabel.center = CGPoint(x: sliderBarView.center.x, y: position.y)
                
                colorView.frame = CGRect(x: 0, y: 0, width: sliderBarView.frame.width, height: thumbSliderLabel.center.y - sliderBarView.frame.origin.y)
                
                let percentSlider = 100 * (1 - (colorView.frame.height) / (sliderBarView.frame.height))
                
                thumbSliderLabel.text = "\(Int(percentSlider))%"
            }
        }
    }
}
