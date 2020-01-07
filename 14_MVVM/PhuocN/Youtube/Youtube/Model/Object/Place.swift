//
//  Location.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class Place {
    var name: String
    var avatar: String
    var address: String
    var distance: String
    var rates: String
    var isFavorite: Bool
    
    init(name: String, avatar: String, address: String, distance: String, rates: String, isFavorite: Bool) {
        self.name = name
        self.avatar = avatar
        self.address = address
        self.distance = distance
        self.rates = rates
        self.isFavorite = isFavorite
    }
}

extension Place {
    static var places: [Place] {
        return [Place(name: "Coffee 1", avatar: "Coffee 1", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                Place(name: "Coffee 2", avatar: "Coffee 2", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                Place(name: "Coffee 3", avatar: "Coffee 3", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: true),
                Place(name: "Coffee 4", avatar: "Coffee 4", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                Place(name: "Coffee 5", avatar: "Coffee 5", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                Place(name: "Coffee 6", avatar: "Coffee 6", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                Place(name: "Coffee 7", avatar: "Coffee 7", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: true),
                Place(name: "Coffee 8", avatar: "Coffee 8", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                Place(name: "Coffee 9", avatar: "Coffee 9", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                Place(name: "Coffee 10", avatar:"Coffee 10", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: true)]
    }
}
