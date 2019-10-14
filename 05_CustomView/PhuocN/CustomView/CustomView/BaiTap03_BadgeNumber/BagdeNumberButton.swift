//
//  BagdeNumberButton.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/7/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class BagdeNumberButton: UIButton {
  
  enum position {
    case topLeft
    case topRight
    case topCenter
    case centerLeft
    case centerRight
    case bottomLeft
    case bottomRight
    case bottomCenter
    
    func addNumberBadgeLabelAtPositon(inRect bounds: CGRect) -> CGPoint {
      switch self {
      case .topLeft:
        return CGPoint(x: 0, y: 0)
      case .topRight:
        return CGPoint(x: bounds.maxX, y: 0)
      case .topCenter:
        return CGPoint(x: bounds.midX, y: 0)
      case .centerLeft:
        return CGPoint(x: 0, y: bounds.midY)
      case .centerRight:
        return CGPoint(x: bounds.maxX, y: bounds.midY)
      case .bottomLeft:
        return CGPoint(x: 0, y: bounds.maxY)
      case .bottomCenter:
        return CGPoint(x: bounds.midX, y: bounds.maxY)
      case .bottomRight:
        return CGPoint(x: bounds.maxX, y: bounds.maxY)
      }
    }
  }
  
  var numberBagdePosition: position = .topLeft {
    didSet {
      numberBadgeLabel.center = numberBagdePosition.addNumberBadgeLabelAtPositon(inRect: bounds)
    }
  }
  
  var text: String = "" {
    didSet {
      let width = text.width(constraintedHeight: heightBagde, font: numberBadgeLabel.font)
      numberBadgeLabel.frame.size = CGSize(width: width + 10, height: heightBagde)
      numberBadgeLabel.center = numberBagdePosition.addNumberBadgeLabelAtPositon(inRect: bounds)
      numberBadgeLabel.text = text
    }
  }
  
  let heightBagde: CGFloat = 20
  
  let numberBadgeLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .red
    label.numberOfLines = 0
    label.textColor = .white
    label.textAlignment = .center
    label.clipsToBounds = true
    label.font = UIFont.systemFont(ofSize: 12)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    let width = text.width(constraintedHeight: heightBagde, font: numberBadgeLabel.font)
    numberBadgeLabel.frame.size = CGSize(width: width + 30, height: heightBagde)
    numberBadgeLabel.center = numberBagdePosition.addNumberBadgeLabelAtPositon(inRect: frame)
    numberBadgeLabel.text = text
    numberBadgeLabel.layer.cornerRadius = numberBadgeLabel.frame.height / 2
    addSubview(numberBadgeLabel)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension String {
  func width(constraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
    let label =  UILabel(frame: CGRect(x: 0, y: 0, width: .greatestFiniteMagnitude, height: height))
    label.numberOfLines = 0
    label.text = self
    label.font = font
    label.sizeToFit()
    return label.frame.width
  }
}

