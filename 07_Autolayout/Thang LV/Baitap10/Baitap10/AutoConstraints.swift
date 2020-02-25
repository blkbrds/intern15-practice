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
    
    @IBAction private func tapAction(_ sender: UIButton) {
        heightConstraints.enumerated().forEach { (index: Int, contraint: NSLayoutConstraint) in
            if index == sender.tag {
                contraint.constant = 100
            } else {
                contraint.constant = 50
            }
            UIView.animate(withDuration: 0.5) {
                self.layoutIfNeeded()
            }
        }
        
    }
}
