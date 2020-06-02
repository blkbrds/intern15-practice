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
    
    var value: Int?
    weak var delegate: UserViewDelegate?
    var vc = SliderViewController()
    
    func setupView() {
        whiteSliderView.layer.borderWidth = 1
        thumbnailLabel.layer.cornerRadius = 30
        thumbnailLabel.text = "50"
        thumbnailLabel.textAlignment = .center
        thumbnailLabel.font = .systemFont(ofSize: 10)
        thumbnailLabel.clipsToBounds = true
        vc.delegate = self
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            if touch.view == thumbnailLabel {
                var textLabel: Int = Int((whiteSliderView.bounds.size.height - position.y) / whiteSliderView.bounds.size.height * 100)
                if let value = value {
                    textLabel = value
                }
                if textLabel >= 0 && textLabel <= 100 {
                    delegate?.didTap(view: self, count: textLabel)
                    thumbnailLabel.text = String(textLabel)
                    thumbnailLabel.frame = CGRect(x: thumbnailLabel.frame.origin.x, y: position.y - 30, width: thumbnailLabel.frame.size.width, height: thumbnailLabel.frame.size.height)
                    blueSliderView.frame = CGRect(x: blueSliderView.frame.origin.x, y: position.y , width: blueSliderView.frame.size.width, height: blueSliderView.frame.maxY - position.y)
                    
                }
            }
        }
    }
}

extension SliderView: SliderViewControllerDelegate {
    func sendValue(view: SliderViewController, value: Int) {
        self.value = value
    }
}

