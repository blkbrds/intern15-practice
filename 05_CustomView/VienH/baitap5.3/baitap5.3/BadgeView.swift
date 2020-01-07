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

        let badgeViewController = UILabel()
        badgeViewController.numberOfLines = 0
        badgeViewController.frame.size = CGSize(width: 50, height: 50)
        badgeViewController.textAlignment = .center
        badgeViewController.alpha = 1
        badgeViewController.backgroundColor = .red
        badgeViewController.layer.cornerRadius = 5
        badgeViewController.text = "\(value)   "
        badgeViewController.sizeToFit()
        badgeViewController.clipsToBounds = true

        switch location {
        case .topLeft:
            badgeViewController.center = CGPoint(x: bounds.minX, y: bounds.minY)
        case .topCenter:
            badgeViewController.center = CGPoint(x: bounds.midX, y: bounds.minY)
        case .topRight:
            badgeViewController.center = CGPoint(x: bounds.maxX, y: bounds.minY)
        case .centerLeft:
            badgeViewController.center = CGPoint(x: bounds.minX, y: bounds.midY)
        case .centerRight:
            badgeViewController.center = CGPoint(x: bounds.maxX, y: bounds.midY)
        case .bottomLeft:
            badgeViewController.center = CGPoint(x: bounds.minX, y: bounds.maxY)
        case .bottomCenter:
            badgeViewController.center = CGPoint(x: bounds.midX, y: bounds.maxY)
        case .bottomRight:
            badgeViewController.center = CGPoint(x: bounds.maxX, y: bounds.maxY)
        }
        addSubview(badgeViewController)
    }
}
