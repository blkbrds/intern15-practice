//
//  MySliderView.swift
//  BaiTapCustomView
//
//  Created by PCI0018 on 10/17/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func sendValue(value: Int)
}

class MySliderView: UIView {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var colorImageView: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!

    weak var delegate: MySliderViewDelegate?
    var receiveValue: Int = 0 {
        didSet{
            valueLabel.center = CGPoint(x: valueLabel.center.x, y: backgroundImageView.frame.maxY * (1 - CGFloat(receiveValue) * 0.01))
            colorImageView.frame = CGRect(x: backgroundImageView.frame.minX, y: valueLabel.center.y, width: backgroundImageView.frame.width, height: backgroundImageView.frame.maxY - valueLabel.center.y)
            let percentValue: Int = Int((backgroundImageView.frame.maxY - valueLabel.center.y) / (backgroundImageView.frame.maxY - backgroundImageView.frame.minY) * 100)
            valueLabel.text = "\(percentValue) %"
        }
    }

    override func awakeFromNib() {
        valueLabel.layer.cornerRadius = 3
        valueLabel.text = "0 %"
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        valueLabel.addGestureRecognizer(pan)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

    @objc private func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        if valueLabel.center.y + translation.y >= backgroundImageView.frame.minY && valueLabel.center.y + translation.y <= backgroundImageView.frame.maxY {
            valueLabel.center = CGPoint(x: valueLabel.center.x, y: valueLabel.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self)
            colorImageView.frame = CGRect(x: backgroundImageView.frame.minX, y: valueLabel.center.y, width: backgroundImageView.frame.width, height: backgroundImageView.frame.maxY - valueLabel.center.y)
            let percentValue: Int = Int((backgroundImageView.frame.maxY - valueLabel.center.y) / (backgroundImageView.frame.maxY - backgroundImageView.frame.minY) * 100)
            valueLabel.text = "\(percentValue) %"
            delegate?.sendValue(value: percentValue)
        } else if valueLabel.center.y + translation.y < backgroundImageView.frame.minY {
            valueLabel.text = "100 %"
            delegate?.sendValue(value: 100)
        }
    }
}
