//
//  SliderView.swift
//  SliderViewWithTextField
//
//  Created by PCI0019 on 6/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func didTap(view: SliderView, count: Int)
}

class SliderView: UIView {
    
    @IBOutlet weak var whiteSliderView: UIView!
    @IBOutlet weak var thumbnailLabel: UILabel!
    @IBOutlet weak var blueSliderView: UIView!
    
    weak var delegate: UserViewDelegate?
    var textLabel = 50
    
    func setupView() {
        whiteSliderView.layer.borderWidth = 1
        thumbnailLabel.layer.cornerRadius = 30
        thumbnailLabel.text = "50"
        thumbnailLabel.textAlignment = .center
        thumbnailLabel.font = .systemFont(ofSize: 10)
        thumbnailLabel.clipsToBounds = true
    }
    override func awakeFromNib() {
        setupView()
    }
    func getValue(value: Int) {
        if value >= 0 && value <= 100 {
            thumbnailLabel.text = String(value)
            let y: CGFloat = whiteSliderView.frame.maxY - whiteSliderView.frame.height * CGFloat(value) / 100
            let frame: CGRect = CGRect(x: thumbnailLabel.frame.origin.x, y: y - thumbnailLabel.frame.height / 2, width: thumbnailLabel.frame.width, height: thumbnailLabel.frame.height)
            blueSliderView.frame = CGRect(x: blueSliderView.frame.origin.x, y: y, width: blueSliderView.frame.width, height: blueSliderView.frame.maxY - y)
            thumbnailLabel.frame = frame
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            if touch.view == thumbnailLabel {
                textLabel = Int((whiteSliderView.bounds.height - position.y) / whiteSliderView.bounds.height * 100)
                if textLabel >= 0 && textLabel <= 100 {
                    delegate?.didTap(view: self, count: textLabel)
                    thumbnailLabel.text = String(textLabel)
                    thumbnailLabel.frame = CGRect(x: thumbnailLabel.frame.origin.x, y: position.y - thumbnailLabel.frame.height / 2, width: thumbnailLabel.frame.width, height: thumbnailLabel.frame.height)
                    blueSliderView.frame = CGRect(x: blueSliderView.frame.origin.x, y: position.y , width: blueSliderView.frame.width, height: blueSliderView.frame.maxY - position.y)
                }
            }
        }
    }
}
