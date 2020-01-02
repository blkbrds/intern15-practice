//
//  ChartViewCustom.swift
//  BaiTap02
//
//  Created by An Nguyễn on 12/28/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class ChartViewCustom: UIView {

    var valueLabel: UILabel!
    var value: CGFloat {
        didSet {
            setNeedsDisplay()
            valueLabel.text = "\(value)"
        }
    }

    override init(frame: CGRect) {
        self.value = 50
        super.init(frame: frame)
        setLayout()
    }

    override func draw(_ rect: CGRect) {
        drawChart()
    }

    private func setLayout() {
        self.backgroundColor = UIColor.clear
        valueLabel = UILabel(frame: CGRect(x: self.bounds.width / 2 - 30, y: self.bounds.height / 2 - 30, width: 60, height: 60))
        valueLabel.text = "\(value)"
        self.addSubview(valueLabel)
    }

    private func drawChart() {
        var path = UIBezierPath(roundedRect: CGRect(x: 10, y: 10, width: self.bounds.width - 20, height: self.bounds.height - 20), cornerRadius: self.bounds.height / 2 - 10)
        UIColor.cyan.setStroke()
        path.lineWidth = 20
        path.stroke()

        path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width / 2,
                                                y: self.bounds.height / 2),
                                                radius: self.bounds.width / 2 - 10,
                                                startAngle: CGFloat.pi * 3 / 2,
                                                endAngle: CGFloat.pi * 2 * value / 100 - CGFloat.pi/2,
                                                clockwise: true)
        UIColor.red.setStroke()
        path.lineWidth = 20
        path.stroke()
        path.close()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
