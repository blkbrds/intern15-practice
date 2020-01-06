//
//  City.swift
//  baitap10.3
//
//  Created by user on 12/16/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import Foundation

final class City {

    var name: String
    var district: [District]

    init(name: String, district: [District]) {
        self.name = name
        self.district = district
    }
}
