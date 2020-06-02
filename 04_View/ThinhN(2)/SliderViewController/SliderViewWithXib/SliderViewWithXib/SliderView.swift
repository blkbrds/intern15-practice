//
//  SliderView.swift
//  SliderViewWithXib
//
//  Created by PCI0019 on 6/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SliderView: UIView {
    
    @IBOutlet weak var whiteSliderView: UIView!
    @IBOutlet weak var thumbnailSliderLabel: UILabel!
    @IBOutlet weak var blueSliderView: UIView!
    
    func setupView() {
        whiteSliderView.layer.borderWidth = 1
        whiteSliderView.clipsToBounds = true
        thumbnailSliderLabel.layer.cornerRadius = 30
        thumbnailSliderLabel.clipsToBounds = true
        thumbnailSliderLabel.text = "50"
        thumbnailSliderLabel.textAlignment = .center
        thumbnailSliderLabel.font = .systemFont(ofSize: 10)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            if touch.view == thumbnailSliderLabel {
                let textLabel: Int = Int((whiteSliderView.bounds.size.height - position.y) / whiteSliderView.bounds.size.height * 100)
                if textLabel >= 0 && textLabel <= 100 {
                    thumbnailSliderLabel.text = String(textLabel)
                    thumbnailSliderLabel.frame = CGRect(x: thumbnailSliderLabel.frame.origin.x, y: position.y - 30 , width: thumbnailSliderLabel.frame.size.width, height: thumbnailSliderLabel.frame.size.height)
                    blueSliderView.frame = CGRect(x: blueSliderView.frame.origin.x, y: position.y , width: blueSliderView.frame.size.width, height: blueSliderView.frame.maxY - position.y)
                }
            }
        }
    }
}
