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
        let BadgeViewController = UILabel()
        BadgeViewController.numberOfLines = 0
        BadgeViewController.frame.size = CGSize(width: 50, height: 50)
        BadgeViewController.textAlignment = .center
        BadgeViewController.alpha = 1
        BadgeViewController.backgroundColor = .red
        BadgeViewController.layer.cornerRadius = 5
        BadgeViewController.text = "\(value)   "
        BadgeViewController.sizeToFit()
        BadgeViewController.clipsToBounds = true

        switch location {
        case .topLeft:
            BadgeViewController.center = CGPoint(x: bounds.minX, y: bounds.minY)
        case .topCenter:
            BadgeViewController.center = CGPoint(x: bounds.midX, y: bounds.minY)
        case .topRight:
            BadgeViewController.center = CGPoint(x: bounds.maxX, y: bounds.minY)
        case .centerLeft:
            BadgeViewController.center = CGPoint(x: bounds.minX, y: bounds.midY)
        case .centerRight:
            BadgeViewController.center = CGPoint(x: bounds.maxX, y: bounds.midY)
        case .bottomLeft:
            BadgeViewController.center = CGPoint(x: bounds.minX, y: bounds.maxY)
        case .bottomCenter:
            BadgeViewController.center = CGPoint(x: bounds.midX, y: bounds.maxY)
        case .bottomRight:
            BadgeViewController.center = CGPoint(x: bounds.maxX, y: bounds.maxY)
        }
        addSubview(BadgeViewController)
    }
}
