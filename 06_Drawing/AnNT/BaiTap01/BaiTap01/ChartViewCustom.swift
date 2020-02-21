//
//  ChartViewCustom.swift
//  BaiTap01
//
//  Created by An Nguyễn on 12/28/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

final class ChartViewCustom: UIView {

    var maxvalue: CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var arrValues:[CGFloat]!
    var names: [String]!

    override init(frame: CGRect) {
        self.maxvalue = 100
        arrValues = [20, 40, 80, 100]
        names = ["Monday", "Tuesday", "Wednesday", "Thursday"]
        super.init(frame: frame)
    }

    override func draw(_ rect: CGRect) {
        drawChart()
    }

    private func drawChart() {
        let path = UIBezierPath()
        for i in stride(from: 0, to: 6, by: 1) {
            let y = self.bounds.height - CGFloat(i) * self.bounds.height / 6 - 50
            let labelValue = UILabel(frame: CGRect(x: 0, y: y - 25, width: 50, height: 50))
            labelValue.text = "\(Int(self.maxvalue) * i / 5)"
            labelValue.textAlignment = .center
            self.addSubview(labelValue)
            path.move(to: CGPoint(x: 50, y: y))
            path.addLine(to: CGPoint(x: self.bounds.width - 20, y: y))
            UIColor.gray.setStroke()
            path.lineWidth = 3
            path.stroke()
        }
        path.close()
        drawRectangle(center: CGPoint(x: 50, y: self.bounds.height - 52), value: 50)
    }
    
    private func drawRectangle(center: CGPoint, value: CGFloat){
        let path = UIBezierPath()
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + 40, y: center.y))
        path.addLine(to: CGPoint(x: center.x + 40, y: center.y - value/maxvalue * self.bounds.height/6))
        path.addLine(to: CGPoint(x: center.x, y: center.y - value/maxvalue * self.bounds.height/6))
        UIColor.yellow.setFill()
        path.fill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
