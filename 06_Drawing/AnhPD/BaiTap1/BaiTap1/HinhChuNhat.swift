//
//  HinhChuNhat.swift
//  BaiTap1
//
//  Created by PCI0012 on 4/6/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HinhChuNhat: UIView {
        
    override func draw(_ rect: CGRect) {
        // create path
        let path = createPath()
        
        // fill
        let fillColor = UIColor.orange
        fillColor.setFill()
        path.fill()
    }
    
    func createPath() -> UIBezierPath {
        let path = UIBezierPath(rect: self.bounds)
        return path
    }
}
