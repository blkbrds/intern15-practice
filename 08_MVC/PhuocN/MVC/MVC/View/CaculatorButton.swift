//
//  CaculatorButton.swift
//  MVC
//
//  Created by PhuocNguyen on 10/14/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class CalculatorButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        config()
    }
    
    func config() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
    }
}
