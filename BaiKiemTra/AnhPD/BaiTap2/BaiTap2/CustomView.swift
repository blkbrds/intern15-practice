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
        let view1 = UIView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        view1.backgroundColor = .white
        self.addSubview(view1)
        
        let name = UILabel(frame: CGRect(x: 20, y: 50, width: 100, height: 50))
        name.text = "Justin Nguyen"
        view1.addSubview(name)
    }

}
