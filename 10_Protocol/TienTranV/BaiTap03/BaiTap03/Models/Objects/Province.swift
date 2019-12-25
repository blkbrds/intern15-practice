//
//  Province.swift
//  BaiTap03
//
//  Created by PCI0002 on 12/2/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class Province {
    var name: String
    var districts: [District]
    
    init(name: String, districts: [District]) {
        self.name = name
        self.districts = districts
    }
}
