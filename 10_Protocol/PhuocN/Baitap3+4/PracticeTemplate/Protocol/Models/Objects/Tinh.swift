//
//  Tinh.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

class Tinh {
    var name: String
    var huyen: [Huyen]
    
    init(name: String, huyen: [Huyen]) {
        self.name = name
        self.huyen = huyen
    }
}
