//
//  Region.swift
//  Baitap10.3
//
//  Created by ANH NGUYỄN on 11/7/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
class Region {
    var name: String = ""
    var tinh: [Tinh]

    init(name: String, tinh: [Tinh]) {
        self.name = name
        self.tinh = tinh
    }
}
let location: [Region] = [Region(name: "Mien Trung", tinh: [
    Tinh(name: "Tinh Da Nang", huyen: [Huyen(
        name: "Quan Cam Le"), Huyen(name: "Quan Lien Chieu"), Huyen(name: "Quan 3"), Huyen(name: "Quan Hai Chau"), Huyen(name: "Quan Son Tra")]),
    Tinh(name: "Tinh Da Nang", huyen: [Huyen(
        name: "Quan Cam Le"), Huyen(name: "Quan Lien Chieu"), Huyen(name: "Quan 3"), Huyen(name: "Quan Hai Chau"), Huyen(name: "Quan Son Tra")]),
    Tinh(name: "Tinh Da Nang", huyen: [Huyen(
        name: "Quan Cam Le"), Huyen(name: "Quan Lien Chieu"), Huyen(name: "Quan 3"), Huyen(name: "Quan Hai Chau"), Huyen(name: "Quan Son Tra")]),
    Tinh(name: "Tinh Da Nang", huyen: [Huyen(
        name: "Quan Cam Le"), Huyen(name: "Quan Lien Chieu"), Huyen(name: "Quan 3"), Huyen(name: "Quan Hai Chau"), Huyen(name: "Quan Son Tra")]),
    Tinh(name: "Tinh Da Nang", huyen: [Huyen(
        name: "Quan Cam Le"), Huyen(name: "Quan Lien Chieu"), Huyen(name: "Quan 3"), Huyen(name: "Quan Hai Chau"), Huyen(name: "Quan Son Tra")]),
    Tinh(name: "Tinh Da Nang", huyen: [Huyen(
        name: "Quan Cam Le"), Huyen(name: "Quan Lien Chieu"), Huyen(name: "Quan 3"), Huyen(name: "Quan Hai Chau"), Huyen(name: "Quan Son Tra")]),
    ])]
