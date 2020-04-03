//
//  ChartView.swift
//  baiTapDrawing
//
//  Created by ADMIN on 4/1/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

struct  Value {
    var value: CGFloat
    var color: UIColor
}
final class CharView: UIView {
    private var path: UIBezierPath?
    private var shapeLayer: CAShapeLayer?
    private var bottomPadding: CGFloat = 20
    private var lelfPadding: CGFloat = 30
    private var rightPadding: CGFloat = 50
    private var lineWidth: CGFloat = 20
    private var spacePadding: CGFloat = 0
    var values: [Value] = [] {
        didSet{
            setNeedsDisplay()
        }
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .darkGray
        clipsToBounds = true
        spacePadding = (bounds.width - 2 * rightPadding - CGFloat(values.count) * lineWidth) / 6
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawChart()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func drawChart(){
        drawLineHorizontal()
        let valuesCGFloat = values.map {(item) -> CGFloat in
            return item.value
        }
        guard let maxValue = valuesCGFloat.max() else{ return }
        var x: CGFloat = rightPadding
        let yStart: CGFloat = bounds.height - bottomPadding
        var yEnd: CGFloat = yStart
        for index in 0..<values.count{
            yEnd -=  200 * values[index].value / maxValue
            drawLineVertical(x: x, yStart: yStart, yEnd: yEnd, color: values[index].color)
            x += spacePadding
            yEnd = yStart
        }
    }
    private func drawLineVertical(x: CGFloat, yStart: CGFloat, yEnd: CGFloat, color: UIColor){
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
    private func drawLineHorizontal(){
        path = UIBezierPath()
        path?.move(to: CGPoint(x: lelfPadding, y: self.bounds.height - bottomPadding))
        path?.addLine(to: CGPoint(x: self.bounds.maxX, y: bounds.height - bottomPadding))
        path?.close()
        shapeLayer = CAShapeLayer()
        shapeLayer?.strokeColor = UIColor.red.cgColor
        shapeLayer?.lineWidth = 1
        shapeLayer?.path = path?.cgPath
        guard let shapeLayer = shapeLayer else {
            return
        }
        layer.addSublayer(shapeLayer)
    }
}
