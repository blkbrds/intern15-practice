//
//  MySliderView.swift
//  BaiTapCustomView
//
//  Created by PCI0018 on 10/17/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func mySliderView(view: MySliderView, needPerform action: MySliderView.Action)
}

final class MySliderView: UIView {

    enum Action {
        case sendValue(Int)
    }

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var colorImageView: UIImageView!
    @IBOutlet private weak var valueLabel: UILabel!

    weak var delegate: MySliderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        valueLabel.layer.cornerRadius = 3
        valueLabel.text = "0 %"

        let panValueLabel = UIPanGestureRecognizer(target: self, action: #selector(handlePanGuesture(sender:)))
        valueLabel.addGestureRecognizer(panValueLabel)
    }

    var receiveValue: Int = 0 {
        didSet {
            valueLabel.center = CGPoint(x: valueLabel.center.x, y: backgroundImageView.frame.maxY * (1 - CGFloat(receiveValue) * 0.01))
            colorImageView.frame = CGRect(x: backgroundImageView.frame.minX, y: valueLabel.center.y, width: backgroundImageView.frame.width, height: backgroundImageView.frame.maxY - valueLabel.center.y)
            let percentValue: Int = Int((backgroundImageView.frame.maxY - valueLabel.center.y) / (backgroundImageView.frame.maxY - backgroundImageView.frame.minY) * 100)
            valueLabel.text = "\(percentValue) %"
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

    @objc private func handlePanGuesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        if valueLabel.center.y + translation.y >= backgroundImageView.frame.minY && valueLabel.center.y + translation.y <= backgroundImageView.frame.maxY {
            valueLabel.center = CGPoint(x: valueLabel.center.x, y: valueLabel.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self)
            colorImageView.frame = CGRect(x: backgroundImageView.frame.minX, y: valueLabel.center.y, width: backgroundImageView.frame.width, height: backgroundImageView.frame.maxY - valueLabel.center.y)
            let percentValue: Int = Int((backgroundImageView.frame.maxY - valueLabel.center.y) / (backgroundImageView.frame.maxY - backgroundImageView.frame.minY) * 100)
            valueLabel.text = "\(percentValue) %"
            delegate?.mySliderView(view: self, needPerform: .sendValue(percentValue))
        } else if valueLabel.center.y + translation.y < backgroundImageView.frame.minY {
            valueLabel.text = "100 %"
            delegate?.mySliderView(view: self, needPerform: .sendValue(100))
        }
    }
}
