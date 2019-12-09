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
    private let bottomPadding: CGFloat = 50
    private let leftPađding: CGFloat = 30
    private let rightPadding: CGFloat = 50
    private let lineWidth: CGFloat = 20
    private var spacePadding: CGFloat = 0

    var values: [Value] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 0.2548159247)
        clipsToBounds = true

        spacePadding = (bounds.width - 2 * rightPadding - CGFloat(values.count) * lineWidth) / 6
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawChart()
    }

    private func drawChart() {
        drawLineHorizontal()

        let valuesCGFloat  = values.map { (item) -> CGFloat in
            return item.value
        }
        guard let maxValue = valuesCGFloat.max() else { return }
        var x: CGFloat = rightPadding
        let yStart: CGFloat = bounds.height - bottomPadding
        var yEnd: CGFloat = yStart

        for index in 0..<values.count {
            yEnd -= 150 * values[index].value / maxValue

            drawLineVertical(x: x, yStart: yStart, yEnd: yEnd, color: values[index].color)
            x += spacePadding

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
        guard let shapeLayer = shapeLayer else { return }
        layer.addSublayer(shapeLayer)
    }

    private func drawLineHorizontal() {
        path = UIBezierPath()
        path?.move(to: CGPoint(x: leftPađding, y: self.bounds.height - bottomPadding))
        path?.addLine(to: CGPoint(x: self.bounds.maxX - leftPađding, y: self.bounds.height - bottomPadding))
        path?.close()

        shapeLayer = CAShapeLayer()
        shapeLayer?.strokeColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 0.4205372432)
        shapeLayer?.lineWidth = 2
        shapeLayer?.path = path?.cgPath
        guard let shapeLayer = shapeLayer else {
            return
        }
        layer.addSublayer(shapeLayer)
    }
}
