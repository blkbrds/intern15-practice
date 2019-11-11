//
//  State.swift
//  Protocol
//
//  Created by PCI0018 on 11/6/19.
//

import Foundation

class State {

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
                                city: [City(name: "Đà Nẵng", district: [District(name: "Thanh Khê"), District(name: "Hải Châu")]),
                                       City(name: "Quảng Nam", district: [District(name: "Đại Phong"), District(name: "Đại To")])]),
                          State(name: "Nam",
                                city: [City(name: "Hồ Chí Minh", district: [District(name: "Quận 1"), District(name: "Quận 2")])])]
