//
//  Address.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class Address {
    private var thumnailImage: UIImage
    private var address: String
    private var rating: String
    private var distance: Float
    private var nameImage: String

    init(avatar: UIImage, address: String, name: String, distance: Float, value: String) {
        self.thumnailImage = avatar
        self.address = address
        self.rating = value
        self.distance = distance
        self.nameImage = name
    }
}

extension Address {
    static func getDummyDatas() -> [Address] {
        var users: [Address] = []
        for _ in 1...30 {
            let user = Address(avatar: UIImage(named: "ic-image-home")!, address: "To 38D PhongBac11", name: "Nha Cua Hanh", distance: 6, value: "9/10")
            users.append(user)
        }
        return users
    }
}
