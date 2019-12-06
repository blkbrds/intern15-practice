//
//  Address.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
class Address {
    var avatarImage: String
    var address: String
    var value: String
    var distance: String
    var nameImage: String

    init(avatar: String, address: String, name: String, distance: String, value: String) {
        self.avatarImage = avatar
        self.address = address
        self.value = value
        self.distance = distance
        self.nameImage = name
    }
}
extension Address {
    static func getDummyDatas() -> [Address] {
        var users: [Address] = []

        for i in 1...30 {
            let user = Address(avatar: "Home", address: "To 38D PhongBac11", name: "Nha Cua Hanh", distance: "6km", value: "9/10")
            users.append(user)
        }
        return users
    }
}
