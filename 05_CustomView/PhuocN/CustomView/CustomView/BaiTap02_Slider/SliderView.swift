//
//  SliderView.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/7/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol SliderViewDelegate: class {
    func changeValue(value: CGFloat)
}

class SliderView: UIView {
    
    let thumbLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.textColor = .white
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 0.5
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    weak var delegate: SliderViewDelegate?
    var isChange = false
    var value: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        thumbLabel.frame = CGRect(x: 0, y: frame.height - 30 - CGFloat(value) / 100.0 * frame.height, width: 50, height: 30)
        thumbLabel.text = String(Int(value))
        thumbLabel.isUserInteractionEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panThumb(_:)))
        thumbLabel.addGestureRecognizer(panGesture)
        addSubview(thumbLabel)
        backgroundColor = .white
    }
    
    override func draw(_ rect: CGRect) {
        let percent: CGFloat = value / 100.0
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.move(to: CGPoint(x: 0,y: 0))
        context?.addLine(to: CGPoint(x: self.bounds.midX,y: self.bounds.maxY - 15))
        context?.addLine(to: CGPoint(x: self.bounds.width,y: 0))
        context?.addLine(to: CGPoint.zero)
        context?.setLineWidth(1)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.setFillColor(UIColor.white.cgColor)
        context?.strokePath()
        context?.closePath()
        context?.fillPath()
        
        let context1 = UIGraphicsGetCurrentContext()
        context1?.move(to: CGPoint(x: self.bounds.midX,y: self.bounds.maxY - 15))
        context1?.addLine(to: CGPoint(x: self.bounds.midX + self.bounds.width / 2 * percent,y: self.bounds.maxY - self.bounds.height * percent - 15))
        context1?.addLine(to: CGPoint(x: self.bounds.midX - self.bounds.width / 2 * percent, y: self.bounds.maxY - self.bounds.height * percent - 15))
        context1?.addLine(to: CGPoint(x: self.bounds.midX,y: self.bounds.maxY - 15))
        context1?.setFillColor(UIColor.systemBlue.cgColor)
        context1?.fillPath()
    }
    
    @objc func panThumb(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: self)
        guard thumbLabel.center.y + transition.y <= frame.height - 15 && thumbLabel.center.y + transition.y + 1 >= 0 else { return }
        thumbLabel.center = CGPoint(x: thumbLabel.center.x, y: thumbLabel.center.y + transition.y)
        sender.setTranslation(CGPoint.zero, in: self)
        value = (frame.height - 15 - thumbLabel.center.y) * 100.0 / (frame.height - 15)
        isChange = true
        delegate?.changeValue(value: value)
    }
    
    func updateUI() {
        thumbLabel.text = "\(Int(value))"
        if !isChange {
            thumbLabel.frame = CGRect(x: 0, y: frame.height - 15 - CGFloat(value) / 100.0 * frame.height, width: 50, height: 30)
        }
        setNeedsDisplay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
