//
//  ChartView.swift
//  ExampleDrawing
//
//  Created by PCI0002 on 11/20/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

struct Value {
    var value: CGFloat
    var color: UIColor
}

final class ChartView: UIView {

    private var path: UIBezierPath?

    private var shapeLayer: CAShapeLayer?
    private let bottom: CGFloat = 50
    private let left: CGFloat = 30
    private let right: CGFloat = 50
    private let lineWidth: CGFloat = 20
    private var space: CGFloat = 0

    var values: [Value] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 0.2548159247)
        self.clipsToBounds = true
        
        
        space = (self.bounds.width - 2 * right - CGFloat(values.count) * lineWidth) / 6
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func draw(_ rect: CGRect) {
        drawChart()
    }

    private func drawChart() {
        drawLineHorizontal()
        
        let value = values.map { (value: Value) -> CGFloat in
            return value.value
        }
        guard let maxValue = value.max() else { return }
        var x: CGFloat = right
        let yStart: CGFloat = self.bounds.height - bottom
        var yEnd: CGFloat = yStart

        for index in 0..<values.count {
            yEnd -= 150 * values[index].value / maxValue

            drawLineVertical(x: x, yStart: yStart, yEnd: yEnd, color: values[index].color)
            x += space

            yEnd = yStart
        }
    }

    private func drawLineVertical(x: CGFloat, yStart: CGFloat, yEnd: CGFloat, color: UIColor) {
        path = UIBezierPath()
        path?.move(to: CGPoint(x: x, y: yStart))
        path?.addLine(to: CGPoint(x: x, y: yEnd))
        path?.close()

        shapeLayer = CAShapeLayer()
        shapeLayer?.strokeColor = color.cgColor
        shapeLayer?.lineWidth = lineWidth
        shapeLayer?.path = path?.cgPath
        guard let shapeLayer = shapeLayer else {
            return
        }
        self.layer.addSublayer(shapeLayer)
    }

    private func drawLineHorizontal() {
        path = UIBezierPath()
        path?.move(to: CGPoint(x: left, y: self.bounds.height - bottom))
        path?.addLine(to: CGPoint(x: self.bounds.maxX - left, y: self.bounds.height - bottom))
        path?.close()

        shapeLayer = CAShapeLayer()
        shapeLayer?.strokeColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 0.4205372432)
        shapeLayer?.lineWidth = 2
        shapeLayer?.path = path?.cgPath
        guard let shapeLayer = shapeLayer else {
            return
        }
        self.layer.addSublayer(shapeLayer)
    }
}
