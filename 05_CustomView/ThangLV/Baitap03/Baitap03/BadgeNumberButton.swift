//
//  BadgeNumberButton.swift
//  Baitap03
//
//  ßCreated by PCI0008 on 12/19/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

protocol BadgeNumberButtonDelegate: class {
    func buttonDidClick(index: Int)
}

class BadgeNumberButton: UIView {

    @IBOutlet var labelView: UILabel!
    @IBOutlet var buttonView: UIButton!
    weak var delegate: BadgeNumberButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        buttonView = UIButton(frame: CGRect(x: 0, y: 10, width: 50, height: 20))
        addSubview(buttonView!)
        labelView = UILabel(frame: CGRect(x: 0, y: 7, width: 10, height: 6))
        addSubview(labelView!)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
