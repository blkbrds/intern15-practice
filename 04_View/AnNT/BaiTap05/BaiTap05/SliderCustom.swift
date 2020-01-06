//
//  SliderCustom.swift
//  BaiTap05
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

protocol SliderCustomDelegate: class {
    func customView(customView: SliderCustom, needPerformAction action: SliderCustom.Action)
}

class SliderCustom: UISlider {

    enum Action {
        case valueChanged(value: Float)
    }

    weak var delegate: SliderCustomDelegate?
    var labelvalue: UILabel!

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.height, height: frame.width))
        setupLayout()
    }

    private func setupLayout() {
        self.transform = CGAffineTransform(rotationAngle: CGFloat.pi * -90 / 180)
        self.addTarget(self, action: #selector(handleValueChanged), for: .valueChanged)
        self.minimumValue = 0
        self.maximumValue = 100
        labelvalue = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        labelvalue.transform = CGAffineTransform(rotationAngle: CGFloat.pi * -90 / 180)
        labelvalue.layer.cornerRadius = 30
        labelvalue.clipsToBounds = true
        labelvalue.backgroundColor = .orange
        labelvalue.textAlignment = .center
        labelvalue.textColor = .white
        labelvalue.font = UIFont.systemFont(ofSize: 25)
        handleValueChanged(self)
    }

    @objc private func handleValueChanged(_ sender: SliderCustom) {
        labelvalue.text = "\(Int(round(sender.value / sender.maximumValue * 100)))"
        self.setThumbImage(UIImage.imageWithLabel(label: labelvalue), for: .normal)
        delegate?.customView(customView: self, needPerformAction: .valueChanged(value: sender.value))
    }

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 20))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage {
    class func imageWithLabel(label: UILabel) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return img
    }
}
