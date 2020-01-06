//
//  BadgeNumberButton.swift
//  Baitap03
//
//  ßCreated by PCI0008 on 12/19/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

protocol BadgeNumberButtonDelegate: class {
    func touchUpInsideBadgeNumberButton(index: Int)
}

class BadgeNumberButton: UIView {

    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var badgeNumberButton: UIButton!
    weak var delegate: BadgeNumberButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        badgeNumberButton = UIButton(frame: CGRect(x: 0, y: 10, width: 50, height: 20))
        addSubview(badgeNumberButton!)
        quantityLabel = UILabel(frame: CGRect(x: 0, y: 7, width: 10, height: 6))
        addSubview(quantityLabel!)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
