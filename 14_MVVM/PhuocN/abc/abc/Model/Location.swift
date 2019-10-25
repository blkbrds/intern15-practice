//
//  Location.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class Location {
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
