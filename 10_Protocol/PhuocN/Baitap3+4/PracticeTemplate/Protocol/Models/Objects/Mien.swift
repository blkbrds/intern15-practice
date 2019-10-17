//
//  Mien.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

class Mien: Location {
    var name: String
    var tinh: [Tinh]
    
    init(name: String, tinh: [Tinh]) {
        self.name = name
        self.tinh = tinh
    }
}
