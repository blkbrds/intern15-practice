//
//  CircleViwe.swift
//  baiTapDrawing(2)
//
//  Created by ADMIN on 4/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
class CircleView: UIView {
    private var startAngle: CGFloat = CGFloat(0) * CGFloat.pi / 180
    private var endAngle: CGFloat = CGFloat(180) * CGFloat.pi / 180
    var values: [CGFloat] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ frame: CGRect){
        for i in 0..<values.count{
            endAngle = endAngle + (CGFloat(values[i]) / sumValue() * 360) * CGFloat.pi / 180
            drawChart(withCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2), radius: self.frame.size.height/2, startAngle: startAngle, endAngle: endAngle, colorwise: true, color: UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: 1))
            startAngle = endAngle
        }
    }
    
    func sumValue() -> CGFloat{
        var sum: CGFloat = 0
        for i in values {
            sum += i
        }
        return sum
        
    }
    func drawChart(withCenter: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, colorwise: Bool, color: UIColor){
        let path = UIBezierPath()
        path.move(to: withCenter)
        path.addArc(withCenter: withCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: colorwise)
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = color.cgColor
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }
}
