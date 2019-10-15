//
//  MySliderView.swift
//  BaiTapCustomView
//
//  Created by PCI0018 on 10/14/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func mySliderView(mySliderView: MySliderView, valueOfTextField: Int)
}

class MySliderView: UIView {
    @IBOutlet weak var sliderImageView: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    weak var delegate: MySliderViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(MySliderView.handlePan(sender:)))
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sliderLabel?.text = "0 %"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        if (sliderLabel?.center.y)! + translation.y >= 150 && (sliderLabel?.center.y)! + translation.y <= 600 {
            sliderLabel?.center = CGPoint(x: (sliderLabel?.center.x)!, y: (sliderLabel?.center.y)! + translation.y)
            sender.setTranslation(CGPoint.zero, in: superview)
//            colorView.frame = CGRect(x: sliderBarView.frame.minX, y: triangleView.sliderLabel.center.y, width: sliderBarView.frame.width, height: sliderBarView.frame.maxY - triangleView.sliderLabel.center.y)
            let value = Int((600 - sliderLabel.center.y) / 450 * 100)
            sliderLabel?.text = "\(value) %"
            delegate?.mySliderView(mySliderView: self, valueOfTextField: value)
        } else if (sliderLabel?.center.y)! + translation.y < 150 {
            sliderLabel?.text = "100 %"
            delegate?.mySliderView(mySliderView: self, valueOfTextField: 100)
        }
    }
}

