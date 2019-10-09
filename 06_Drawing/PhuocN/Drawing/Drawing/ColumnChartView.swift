//
//  lineChartView.swift
//  Drawing
//
//  Created by PhuocNguyen on 10/8/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class LineChartView: UIView {
  var lines: [CGFloat] = [23,5,15,59,32,33,90,79] {
    didSet {
      if lines != oldValue {
        setNeedsDisplay()
      }
    }
  }
  
  var spacing: CGFloat = 5 {
    didSet {
      if spacing != oldValue {
        setNeedsDisplay()
      }
    }
  }
  
  var thumbRadius: CGFloat = 5 {
    didSet {
      if thumbRadius != oldValue {
        spacing = thumbRadius
        setNeedsDisplay()
      }
    }
  }
  
  var maxLine: CGFloat {
    guard let max = lines.max() else { return 0 }
    return max
  }
  
  override func draw(_ rect: CGRect) {
    createLineChart(lineWidth: 2, lineColor: .blue, maskColor: UIColor.systemBlue)
  }
  
  func createLineChart(lineWidth: CGFloat, lineColor: UIColor, maskColor: UIColor) {
    let contentRect = CGRect(origin: CGPoint(x: spacing, y: spacing), size: CGSize(width: frame.width - 2 * spacing, height: frame.height - spacing))
    let path = UIBezierPath()
    lineColor.setStroke()
    path.move(to: CGPoint(x: 5, y: contentRect.height))
    for (index,line) in lines.enumerated() {
      let point = CGPoint(x: contentRect.width * CGFloat(index) / CGFloat(lines.count - 1) + spacing, y: contentRect.height - line * contentRect.height / maxLine + spacing)
      path.addLine(to: point)
    }
    path.addLine(to: CGPoint(x: contentRect.maxX, y: contentRect.maxY))
    path.addLine(to: CGPoint(x: spacing, y: contentRect.maxY))
    path.lineWidth = lineWidth
    path.stroke()
    maskColor.setFill()
    path.fill()
  }
  
  func createThumbs(color: UIColor) {
    let contentRect = CGRect(origin: CGPoint(x: spacing, y: spacing), size: CGSize(width: frame.width - 2 * spacing, height: frame.height - spacing))
    for (index,line) in lines.enumerated() {
      let point = CGPoint(x: contentRect.width * CGFloat(index) / CGFloat(lines.count - 1), y: contentRect.height - line * contentRect.height / maxLine)
      
      let circlePath = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: 2 * thumbRadius, height: 2 * thumbRadius)))
      color.setFill()
      circlePath.fill()
    }
  }
}
