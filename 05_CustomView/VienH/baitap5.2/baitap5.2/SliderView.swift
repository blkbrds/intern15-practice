//
//  SliderView.swift
//  baitap5.2
//
//  Created by user on 11/20/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func mySliderView(view: SliderView, needPerform action: SliderView.Action)
}

final class SliderView: UIView {
    enum Action {
        case sendValue(percent: Float)
    }

    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var backgroundView: UIView!

    private weak var delegate: MySliderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        valueLabel.layer.cornerRadius = 3
        valueLabel.text = "0 %"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("bun roi nha")
        self.endEditing(true)
    }

    func setValue(percent: Float) {
        let y = Float(frame.size.height) / 100 * (100 - percent)
        var center = valueLabel.center
        center.y = CGFloat(y)
        valueLabel.center = center
        let newFrame = CGRect(x: 0,
            y: CGFloat(y),
            width: frame.size.width,
            height: frame.size.height - CGFloat(y))
        colorView.frame = newFrame
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("position")
        if let touch = touches.first {
            if touch.view == valueLabel {
                let location = touch.location(in: self)
                if location.y >= 0 && location.y <= self.frame.size.height {
                    let percent = 100 - Float(location.y / frame.size.height * 100)
                    setValue(percent: percent)
                    if let delegate = delegate {
                        delegate.mySliderView(view: self, needPerform: .sendValue(percent: percent))
                    }
                }
            }
        }
    }
}
