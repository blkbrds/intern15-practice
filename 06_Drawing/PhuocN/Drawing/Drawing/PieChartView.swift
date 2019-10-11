//
//  PieChartView.swift
//  Drawing
//
//  Created by PhuocNguyen on 10/8/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

struct Pie {
  let value: CGFloat
  let color: UIColor
  let radius: CGFloat
}

class PieChartView: UIView {
  var pies: [Pie] = [Pie(value: 50, color: .blue, radius: 70),
                     Pie(value: 80, color: .green, radius: 80),
                     Pie(value: 110, color: .red, radius: 90),
                     Pie(value: 120, color: .orange, radius: 55)] {
    didSet {
      setNeedsDisplay()
    }
  }
  
  var maskColor: UIColor = .black {
    didSet {
      setNeedsDisplay()
    }
  }
  
  var sum: CGFloat {
    return pies.reduce(0) {$0 + $1.value}
  }
  
  override func draw(_ rect: CGRect) {
    let frame = CGRect(x: self.frame.width / 4, y: 0, width: self.frame.width / 2, height: self.frame.height)
    let maskPath = UIBezierPath(ovalIn: frame)
    maskColor.setFill()
    maskPath.fill()
    let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
    createPieChart()
    let whitePath = UIBezierPath(arcCenter: center, radius: 30, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
    UIColor.white.setFill()
    whitePath.fill()
  }
  
  func pieOfChart(radius: CGFloat, color: UIColor, startAngle: CGFloat, endAngle: CGFloat) {
    let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
    let path = UIBezierPath()
    path.move(to: center)
    path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    color.setFill()
    path.close()
    path.fill()
  }
  
  func createPieChart() {
    var starAngle: CGFloat = 0
    var endAngle: CGFloat = 0
    for pie in pies {
      starAngle = endAngle
      endAngle += pie.value * 2 * .pi / sum
      pieOfChart(radius: pie.radius, color: pie.color, startAngle: starAngle, endAngle: endAngle)
    }
  }
}
