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
    
    func atPosition(ỉnRect bounds: CGRect) -> CGPoint {
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
      numberBagdeLable.center = self.numberBagdePosition.atPosition(ỉnRect: bounds)
    }
  }
  var text: String = "" {
    didSet {
      let width = text.width(constraintedHeight: heightBagde, font: numberBagdeLable.font)
      numberBagdeLable.frame.size = CGSize(width: width + 10, height: heightBagde)
      numberBagdeLable.center = self.numberBagdePosition.atPosition(ỉnRect: bounds)
      numberBagdeLable.text = text
    }
  }
  
  let heightBagde: CGFloat = 20
  
  let numberBagdeLable: UILabel = {
    let lable = UILabel()
    lable.backgroundColor = .red
    lable.numberOfLines = 0
    lable.textColor = .white
    lable.textAlignment = .center
    lable.clipsToBounds = true
    lable.font = UIFont.systemFont(ofSize: 12)
    return lable
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    let width = text.width(constraintedHeight: heightBagde, font: numberBagdeLable.font)
    numberBagdeLable.frame.size = CGSize(width: width + 30, height: heightBagde)
    numberBagdeLable.center = self.numberBagdePosition.atPosition(ỉnRect: frame)
    numberBagdeLable.text = text
    numberBagdeLable.layer.cornerRadius = numberBagdeLable.frame.height / 2
    self.addSubview(numberBagdeLable)
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

