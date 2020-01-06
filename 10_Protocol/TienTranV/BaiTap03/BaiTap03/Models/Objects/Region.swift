//
//  Location.swift
//  BaiTap03
//
//  Created by PCI0002 on 12/2/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class Region {
    var name: String
    var provinces: [Province]
    
    init(name: String, provinces: [Province]) {
        self.name = name
        self.provinces = provinces
    }
}
