//
//  MyButton.swift
//  BaiTapCustomView
//
//  Created by TranVanTien on 11/17/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class MyButton: UIButton {

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

    var isShowBagde: Bool = false {
        didSet {
            showBadge()
        }
    }

    lazy var bagdeLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .purple
        label.textAlignment = .center
        label.textColor = .white
        label.frame.size = CGSize(width: 50, height: 30)
        return label
    }()

    private func showBadge() {
        if isShowBagde {
            addSubview(bagdeLabel)
        } else {
            bagdeLabel.removeFromSuperview()
        }
    }

    func editPositionBagde(position: PositionBadge) {
        bagdeLabel.center = position.position(with: bounds)
    }
}
