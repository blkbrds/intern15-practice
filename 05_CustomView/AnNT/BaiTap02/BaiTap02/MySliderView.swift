//
//  MySliderView.swift
//  BaiTap02
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

protocol MySliderDelegate: class {
    func valueChanged(sliderView: MySliderView, value: CGFloat)
}

class MySliderView: UIView {

    var touchControlLabel: UILabel!
    var fillView: UIView!
    weak var delegate: MySliderDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveTouch(touches)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveTouch(touches)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        let boundView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        boundView.layer.borderColor = UIColor.green.cgColor
        boundView.layer.borderWidth = 2
        boundView.layer.cornerRadius = 5
        self.addSubview(boundView)
        fillView = UIView(frame: CGRect(x: 0, y: self.bounds.height / 2, width: self.bounds.width, height: self.bounds.height / 2))
        fillView.backgroundColor = .red
        self.addSubview(fillView)
        touchControlLabel = UILabel(frame: CGRect(x: self.bounds.width / 2 - (self.bounds.width + 20) / 2,
            y: self.bounds.height / 2 - 25,
            width: self.bounds.width + 20,
            height: 50))
        touchControlLabel.text = "50%"
        touchControlLabel.backgroundColor = .gray
        touchControlLabel.textAlignment = .center
        self.addSubview(touchControlLabel)
    }

    private func moveTouch(_ touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        guard touch.view != self else { return }
        let location = touch.location(in: self)
        if location.y < self.bounds.height && location.y > 0 {
            let value = self.bounds.height - touchControlLabel.frame.midY
            let valuePercent = Int(round((value / self.bounds.height) * 100))
            touchControlLabel.frame.origin.y = location.y - touchControlLabel.bounds.height / 2
            touchControlLabel.text = "\(valuePercent)%"
            fillView.frame = CGRect(x: 0, y: self.bounds.height - value, width: self.bounds.width, height: value)
            delegate?.valueChanged(sliderView: self, value: CGFloat(valuePercent))
        }
    }
}
