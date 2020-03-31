//
//  BadgeNumber.swift
//  baiTapCustomView
//
//  Created by ADMIN on 3/29/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class BadgeNumberButton: UIView {
    var button: UIButton?
    private var badgeNumberLabel = UILabel()
    private var valueBadgeNumber: position
    private var text: String = ""
    enum position {
        case topLeft
        case topCenter
        case topRight
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomCenter
        case bottomRight
    }
    init(frame: CGRect, valueBadgeNumber: position, text: String){
        self.valueBadgeNumber = valueBadgeNumber
        self.text = text
        super.init(frame: frame)
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        button?.backgroundColor = .green
        button?.layer.cornerRadius = 20
        button?.clipsToBounds = true
        button?.setTitle("text", for: .normal)
        addSubview(button!)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI(){
        let temp = 20 + text.count * 10
        badgeNumberLabel.frame.size = CGSize(width: temp, height: 30)
        badgeNumberLabel.textColor = .white
        badgeNumberLabel.text = text
        badgeNumberLabel.backgroundColor = .red
        badgeNumberLabel.layer.cornerRadius = 10
        badgeNumberLabel.clipsToBounds = true
        badgeNumberLabel.textAlignment = .center
        badgeNumberLabel.numberOfLines = 0
        
        switch valueBadgeNumber {
        case.topLeft:
            badgeNumberLabel.center = CGPoint(x: 0, y: 0)
        case.topCenter:
            badgeNumberLabel.center = CGPoint(x: button!.frame.midX, y: 0)
        case .topRight:
            badgeNumberLabel.center = CGPoint(x: button!.frame.maxX, y: 0)
        case .centerLeft:
            badgeNumberLabel.center = CGPoint(x: 0, y: button!.frame.midY)
        case .centerRight:
            badgeNumberLabel.center = CGPoint(x: button!.frame.maxX, y: button!.frame.midY)
        case .bottomLeft:
            badgeNumberLabel.center = CGPoint(x: 0, y: button!.frame.maxY)
        case .bottomCenter:
            badgeNumberLabel.center = CGPoint(x: button!.frame.midX, y: button!.frame.maxY)
        case .bottomRight:
            badgeNumberLabel.center = CGPoint(x: button!.frame.maxX, y: button!.frame.maxY)
        }
        
        if text != "0" {
        addSubview(badgeNumberLabel)
        }
    }
}
