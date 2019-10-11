//
//  LineChartView.swift
//  Drawing
//
//  Created by PhuocNguyen on 10/9/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class LineChartView: UIView {
  var lines: [CGFloat] = [23, 5, 15, 59, 32, 33, 90, 79] {
    didSet {
      if lines != oldValue {
        setNeedsDisplay()
      }
    }
  }
  
  var thumbColor = UIColor.blue {
    didSet {
      if thumbColor != oldValue {
        setNeedsDisplay()
      }
    }
  }
  
  var lineColor = UIColor.blue {
    didSet {
      if lineColor != oldValue {
        setNeedsDisplay()
      }
    }
  }
  
  var maskColor = UIColor.systemBlue {
    didSet {
      if maskColor != oldValue {
        setNeedsDisplay()
      }
    }
  }
  
  var lineWidth: CGFloat = 2 {
    didSet {
      if lineWidth != oldValue {
        setNeedsDisplay()
      }
    }
  }
  
  var thumbRadius: CGFloat = 5 {
    didSet {
      if thumbRadius != oldValue {
        setNeedsDisplay()
      }
    }
  }
  
  var maxLine: CGFloat {
    guard let max = lines.max() else { return 0 }
    return max
  }
  
  override func draw(_ rect: CGRect) {
    createLineChart(lineWidth: lineWidth, lineColor: lineColor, maskColor: maskColor)
    createThumbs(color: thumbColor)
  }
  
  func createLineChart(lineWidth: CGFloat, lineColor: UIColor, maskColor: UIColor) {
    let contentRect = CGRect(origin: CGPoint(x: thumbRadius, y: thumbRadius), size: CGSize(width: frame.width - 2 * thumbRadius, height: frame.height - 2 * thumbRadius))
    let path = UIBezierPath()
    lineColor.setStroke()
    path.move(to: CGPoint(x: 5, y: contentRect.height + thumbRadius))
    for (index,line) in lines.enumerated() {
      let point = CGPoint(x: contentRect.width * CGFloat(index) / CGFloat(lines.count - 1) + thumbRadius, y: contentRect.height - line * contentRect.height / maxLine + thumbRadius)
      path.addLine(to: point)
    }
    path.addLine(to: CGPoint(x: contentRect.maxX, y: contentRect.maxY))
    path.addLine(to: CGPoint(x: thumbRadius, y: contentRect.maxY))
    path.lineWidth = lineWidth
    path.stroke()
    maskColor.setFill()
    path.fill()
  }
  
  func createThumbs(color: UIColor) {
    let contentRect = CGRect(origin: CGPoint(x: thumbRadius, y: thumbRadius), size: CGSize(width: frame.width - 2 * thumbRadius, height: frame.height - 2 * thumbRadius))
    for (index,line) in lines.enumerated() {
      let point = CGPoint(x: contentRect.width * CGFloat(index) / CGFloat(lines.count - 1), y: contentRect.height - line * contentRect.height / maxLine)
      let circlePath = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: 2 * thumbRadius, height: 2 * thumbRadius)))
      color.setFill()
      circlePath.fill()
    }
  }
}

