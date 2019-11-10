//
//  LocationManagement.swift
//  Baitap10.3
//
//  Created by ANH NGUYỄN on 11/7/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
class LocationManagement {
    static let share: LocationManagement = LocationManagement()
    var andress: Andress?
}
class Andress {
    var mien: String
    var tinh : String
    var huyen : String
    
    init(mien: String, tinh: String, huyen: String) {
        self.mien = mien
        self.tinh = tinh
        self.huyen = huyen
    }
}
