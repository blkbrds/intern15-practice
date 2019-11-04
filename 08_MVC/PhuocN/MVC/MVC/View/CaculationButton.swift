//
//  CaculationButton.swift
//  MVC
//
//  Created by PhuocNguyen on 10/14/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class CaculationButton: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
