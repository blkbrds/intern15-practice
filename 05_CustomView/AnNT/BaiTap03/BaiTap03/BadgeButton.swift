//
//  BadgeButton.swift
//  BaiTap03
//
//  Created by An Nguyễn on 12/27/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

enum BadgeAlignt {
    case topLeft, topRight, topCenter, centerLeft, bottomLeft, bottpmCenter, bottomRight, center
    func setupLocation(in view: UIView, badgeView: UIView) -> CGRect {
        switch self {
            case .topLeft:
                return CGRect(x: -badgeView.bounds.width / 2, y: -badgeView.bounds.height/2, width: badgeView.bounds.width, height: badgeView.bounds.height)
            case .centerLeft:
                return CGRect(x: -badgeView.bounds.width / 2, y: view.bounds.height/2, width: badgeView.bounds.width, height: badgeView.bounds.height)
            case .center:
                return CGRect(x: -view.bounds.width / 2, y: -view.bounds.height/2, width: badgeView.bounds.width, height: badgeView.bounds.height)
            //....
            default:
                return CGRect(x: 0, y: 0, width: 0, height: 0)
        }
    }
}

final class BadgeButton: UIButton {
    var badgeNumberLabel: UILabel!
    var badgeAlignt: BadgeAlignt
    
    override init(frame: CGRect) {
        self.badgeAlignt = .topLeft
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.backgroundColor = .green
        badgeNumberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        badgeNumberLabel.frame = badgeAlignt.setupLocation(in: self, badgeView: badgeNumberLabel)
        badgeNumberLabel.layer.cornerRadius = 5
        badgeNumberLabel.backgroundColor = .red
        badgeNumberLabel.text = "10+"
        badgeNumberLabel.textAlignment = .center
        self.addSubview(badgeNumberLabel)
        self.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
    }
    
    @objc func handleClick() {
        UIView.animate(withDuration: 0.02, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [.autoreverse, .curveEaseIn, .curveEaseOut], animations: {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }, completion: { _ in
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            })

        print("Click")
    }
}
