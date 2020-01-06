//
//  MyButton.swift
//  BaiTapCustomView
//
//  Created by TranVanTien on 11/17/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class MyButton: UIButton {

    var badgeNumber = 0 {
        didSet {
            updateUI()
        }
    }

    enum PositionBadge {
        case bottomLeft
        case bottomCenter
        case bottomRight
        case centerRight
        case centerLeft
        case topLeft
        case topCenter
        case topRight

        func position(with frame: CGRect) -> CGPoint {
            switch self {
            case .topRight:
                return CGPoint(x: frame.maxX, y: frame.minY)
            case .topLeft:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .topCenter:
                return CGPoint(x: frame.midX, y: frame.minY)
            case .bottomRight:
                return CGPoint(x: frame.maxX, y: frame.maxY)
            case .bottomLeft:
                return CGPoint(x: frame.minX, y: frame.maxY)
            case .bottomCenter:
                return CGPoint(x: frame.midX, y: frame.maxY)
            case .centerLeft:
                return CGPoint(x: frame.minX, y: frame.midY)
            case .centerRight:
				return CGPoint(x: frame.maxX, y: frame.midY)
            }
        }
    }

    var isShowBadge: Bool = false {
        didSet {
            showBadge()
        }
    }

    lazy private var badgeLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .purple
        label.textAlignment = .center
        label.textColor = .white
        label.frame.size = CGSize(width: 50, height: 30)
        label.numberOfLines = 0
        return label
    }()

    private func showBadge() {
        if isShowBadge {
            addSubview(badgeLabel)
        } else {
            badgeLabel.removeFromSuperview()
        }
    }

    private func updateUI() {
        if badgeNumber == 0 {
            badgeLabel.removeFromSuperview()
        } else {
            badgeLabel.frame.size = CGSize(width: String(badgeNumber).width(constraintedHeight: badgeLabel.frame.height, font: UIFont.systemFont(ofSize: 17)) + 20, height: badgeLabel.frame.height)
            badgeLabel.text = String(badgeNumber)
        }
    }

    func editPositionBagde(position: PositionBadge) {
        badgeLabel.center = position.position(with: bounds)
    }
}

extension String {
    func width(constraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: .greatestFiniteMagnitude, height: height))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        return label.frame.width
    }
}
