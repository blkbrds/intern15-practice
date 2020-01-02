//
//  AutoConstraints.swift
//  AutoLayoutBasic
//
//  Created by TranVanTien on 11/24/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class AutoConstraints: UIView {

    @IBOutlet private var heightConstraints: [NSLayoutConstraint]!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction private func tapAction(_ sender: UIButton) {
        heightConstraints.enumerated().forEach { (index: Int, contraint: NSLayoutConstraint) in
            if index == sender.tag {
                contraint.constant = 100
            } else {
                contraint.constant = 50
            }
        }
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
            sender.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 0.5)
        }
    }
}
