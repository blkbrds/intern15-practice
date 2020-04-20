




//
//  CustomView.swift
//  BaiTap2
//
//  Created by PCI0012 on 4/14/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class CustomView: UIView {

    func draw() {
        let view = UIView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        view.backgroundColor = .gray
        self.addSubview(view)
    }
}
