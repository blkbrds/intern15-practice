//
//  CircleView.swift
//  ExampleDrawing
//
//  Created by PCI0002 on 11/20/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class CircleView: UIView {

    var values: [CGFloat] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 0.3098244863)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawCircle()
    }

    private func drawCircle() {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = min(bounds.width, bounds.height) / 2 - 20

        let sumValues = values.reduce(0) { $0 + $1 }
        var startAngle: CGFloat = .pi / 2
        var endAngle: CGFloat = .pi / 2

        for index in 0..<values.count {
            endAngle += .pi * 2 * values[index] / sumValues

            drawPartCircle(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true, color: UIColor(displayP3Red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1))

            startAngle = endAngle
        }
        drawPartCircle(withCenter: center, radius: radius / 2, startAngle: 0, endAngle: .pi * 2, clockwise: true, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }

    private func drawPartCircle(withCenter: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, color: UIColor) {

        let path = UIBezierPath()
        path.move(to: withCenter)
        path.addArc(withCenter: withCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = color.cgColor
        shapeLayer.path = path.cgPath

        layer.addSublayer(shapeLayer)
    }
}
