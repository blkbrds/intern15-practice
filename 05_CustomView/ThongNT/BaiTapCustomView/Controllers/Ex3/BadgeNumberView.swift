//
//  BadgeNumberView.swift
//  BaiTapCustomView
//
//  Created by PCI0018 on 10/17/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

extension UIButton {

    enum Location {
        case topLeft
        case topCenter
        case topRight
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomCenter
        case bottomRight
    }

    func addLocationToButton(location: Location, value: String) {

        //MARK : - Badge Label config
        let badgeNumberLabel = UILabel()
        badgeNumberLabel.numberOfLines = 0
        badgeNumberLabel.frame.size = CGSize(width: 50, height: 50)
        badgeNumberLabel.textAlignment = .center
        badgeNumberLabel.alpha = 1
        badgeNumberLabel.backgroundColor = .red
        badgeNumberLabel.layer.cornerRadius = 5
        badgeNumberLabel.text = "\(value)   "
        badgeNumberLabel.sizeToFit()
        badgeNumberLabel.clipsToBounds = true

        switch location {
        case .topLeft:
            badgeNumberLabel.center = CGPoint(x: bounds.minX, y: bounds.minY)
        case .topCenter:
            badgeNumberLabel.center = CGPoint(x: bounds.midX, y: bounds.minY)
        case .topRight:
            badgeNumberLabel.center = CGPoint(x: bounds.maxX, y: bounds.minY)
        case .centerLeft:
            badgeNumberLabel.center = CGPoint(x: bounds.minX, y: bounds.midY)
        case .centerRight:
            badgeNumberLabel.center = CGPoint(x: bounds.maxX, y: bounds.midY)
        case .bottomLeft:
            badgeNumberLabel.center = CGPoint(x: bounds.minX, y: bounds.maxY)
        case .bottomCenter:
            badgeNumberLabel.center = CGPoint(x: bounds.midX, y: bounds.maxY)
        case .bottomRight:
            badgeNumberLabel.center = CGPoint(x: bounds.maxX, y: bounds.maxY)
        }
        self.addSubview(badgeNumberLabel)
    }
}
