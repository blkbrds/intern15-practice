//
//  CircleView.swift
//  baiTapDrawing
//
//  Created by ADMIN on 4/2/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

final class CircleView: UIView {

    var values: [CGFloat]?
    private var startCircle: CGFloat = CGFloat(0.0) * CGFloat.pi / 180
    private var endCircle: CGFloat = CGFloat(180) * CGFloat.pi / 180
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        for index in 0..<values!.count{
            endCircle = endCircle + CGFloat(values![index] / sumValues() * 360) * CGFloat.pi / 180
            drawChart(withCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2, startCircle: startCircle, endCircle: endCircle, clockwise: true, color: UIColor(red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1))
            startCircle = endCircle
        }
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    private func sumValues() -> CGFloat{
        var sum: CGFloat = 0
        for item in values!  {
            sum += item
        }
        return sum
    }
    private func drawChart(withCenter: CGPoint, radius: CGFloat, startCircle: CGFloat, endCircle: CGFloat, clockwise: Bool, color: UIColor){
        let path = UIBezierPath()
        path.move(to: withCenter)
        path.addArc(withCenter: withCenter, radius: radius, startAngle: startCircle, endAngle: endCircle, clockwise: clockwise)
        path.close()
        
        let shapLayer = CAShapeLayer()
        shapLayer.fillColor = color.cgColor
        shapLayer.path = path.cgPath
        layer.addSublayer(shapLayer)
    }
    
}
