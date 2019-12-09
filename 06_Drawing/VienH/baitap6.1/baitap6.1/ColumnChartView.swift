//
//  ColumnChartView.swift
//  BaiTapDrawing
//
//  Created by PCI0018 on 10/21/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class ColumnChartView: UIView {

    private var transformedValues: [CGFloat] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // range between columns = weight of columns
        let range = bounds.width / CGFloat(transformedValues.count) / 2
        var parameter: CGFloat = 0.5
        for index in transformedValues {
            drawColumn(height: index, weight: range, space: parameter * range)
            parameter += 2
        }
    }

    private func drawColumn(height: CGFloat, weight: CGFloat, space: CGFloat) {
        if let context = UIGraphicsGetCurrentContext() {
            context.move(to: CGPoint(x: bounds.minX + space, y: bounds.maxY))
            context.addLine(to: CGPoint(x: bounds.minX + space, y: bounds.maxY - height))
            context.addLine(to: CGPoint(x: bounds.minX + weight + space, y: bounds.maxY - height))
            context.addLine(to: CGPoint(x: bounds.minX + weight + space, y: bounds.maxY))
            let red = CGFloat.random(in: 0...255)
            let blue = CGFloat.random(in: 0...255)
            let green = CGFloat.random(in: 0...255)
                        context.setFillColor(UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1).cgColor)
            context.fillPath()
        }
    }

    func transform(values: [CGFloat]) {
        if let maxValue = values.max() {
            for value in values {
                transformedValues.append(value * (bounds.height - 50) / maxValue)
            }
        }
    }
}
