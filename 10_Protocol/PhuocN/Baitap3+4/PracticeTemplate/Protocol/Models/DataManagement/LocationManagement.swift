//
//  LocationManagement.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

class LocationManagement {
    static let share: LocationManagement = LocationManagement()
    var andress: Andress?
    
    private init() {}
}

class Andress {
    var mien: String
    var tinh: String
    var huyen: String
    
    init(mien: String, tinh: String, huyen: String) {
        self.mien = mien
        self.tinh = tinh
        self.huyen = huyen
    }
}
