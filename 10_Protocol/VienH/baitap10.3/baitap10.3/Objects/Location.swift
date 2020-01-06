//
//  Location.swift
//  baitap10.3
//
//  Created by user on 12/16/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import Foundation
final class Location {

    var state: String
    var city: String
    var district: String

    init(state: String = "", city: String = "", district: String = "") {
        self.state = state
        self.city = city
        self.district = district
    }
}
