//
//  SubView.swift
//  AutoLayout
//
//  Created by PCI0019 on 6/10/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SubView: UIView {

    @IBOutlet var containerView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
    func xibSetup() {
        let nib = UINib(nibName: "SubView", bundle: .main)
        nib.instantiate(withOwner: self, options: nil)    
        addSubview(containerView)
    }
}
