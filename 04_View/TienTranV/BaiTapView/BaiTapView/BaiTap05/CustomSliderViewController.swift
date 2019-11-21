//
//  CustomSliderViewController.swift
//  BaiTapView
//
//  Created by TranVanTien on 11/14/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class CustomSliderViewController: UIViewController {

    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var sliderBarView: UIView!
    @IBOutlet private weak var thumbSliderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        setUpThumbSliderLabel()
        setUpViewSlider(view: colorView)
        setUpViewSlider(view: sliderBarView)
        if view.tag == 1 {
            view.frame = CGRect(x: 0, y: 0, width: sliderBarView.frame.width, height: sliderBarView.frame.midY)
        }
    }

    private func setUpViewSlider(view: UIView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 27
        view.layer.borderColor = UIColor.green.cgColor
    }

    private func setUpThumbSliderLabel() {
        thumbSliderLabel.text = "50%"
        thumbSliderLabel.clipsToBounds = true
        thumbSliderLabel.layer.cornerRadius = 40
        thumbSliderLabel.layer.borderWidth = 2
        thumbSliderLabel.layer.borderColor = UIColor.red.cgColor

        thumbSliderLabel.center = CGPoint(x: sliderBarView.frame.midX, y: sliderBarView.frame.midY)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
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

                let percentSlider = 100 * (1 - colorView.frame.height / sliderBarView.frame.height)

                thumbSliderLabel.text = "\(Int(percentSlider))%"
            }
        }
    }
}
