//
//  Stale.swift
//  baitap10.3
//
//  Created by user on 12/16/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import Foundation
final class State {

    var name: String
    var city: [City]

    init(name: String, city: [City]) {
        self.name = name
        self.city = city
    }
}

let locations: [State] = [State(name: "Bắc",
    city: [City(name: "Hà Nội", district: [District(name: "Thanh Xuân"), District(name: "Hai Bà Trưng"), District(name: "Hoàn Kiếm")]),
        City(name: "Hải Phòng", district: [District(name: "Quận 1"), District(name: "Quận 2")])]),
    State(name: "Trung",
        city: [City(name: "Đà Nẵng", district: [District(name: "Thanh Khê"), District(name: "Hải Châu"), District(name: "Cẩm Lệ"), District(name: "Ngũ Hành Sơn")]),
            City(name: "Quảng Nam", district: [District(name: "Cẩm Lệ"), District(name: "Đại To")])]),
    State(name: "Nam",
        city: [City(name: "Hồ Chí Minh", district: [District(name: "Quận 1"), District(name: "Quận 2")])])]

