//
//  PieChartView.swift
//  BaiTapDrawing
//
//  Created by PCI0018 on 10/21/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class PieChartView: UIView {

    private var transformedvalues: [CGFloat] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func draw(_ rect: CGRect) {
        guard !transformedvalues.isEmpty else { return }
        var starAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        for value in transformedvalues {
            endAngle = endAngle + value
            drawPie(radius: 120, startAngle: starAngle, endAngle: endAngle)
            starAngle = endAngle
        }
        drawCircleWhite()
    }

    private func drawPie(radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let pathOustside = UIBezierPath()
        pathOustside.move(to: center)
        pathOustside.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1).setFill()

        pathOustside.close()
        pathOustside.fill()
    }

    private func drawCircleWhite() {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let pathInside = UIBezierPath()
        pathInside.move(to: center)
        pathInside.addArc(withCenter: center, radius: 70, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        pathInside.close()
        UIColor.white.setFill()
        pathInside.fill()
    }

    func transformedValues(values: [CGFloat]) {
        var sum: CGFloat = 0
        for value in values {
            sum = sum + value
        }
        transformedvalues = values.map { $0 * 2 * .pi / sum }
    }
}
