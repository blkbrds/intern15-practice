//
//  Extension.swift
//  ExampleGoogleMaps
//
//  Created by PCI0002 on 12/26/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGPoint {
    func subtractPoint(subY y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x, y: self.y - y)
    }
}
