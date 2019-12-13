//
//  Location.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class Location {
    var name: String
    var address: String
    var image: String
    var rate: String
    var favorites: Bool
    
    init(name: String, address: String, image: String = "", rate: String = "", favorites: Bool = false) {
        self.name = name
        self.address = address
        self.image = image
        self.rate = rate
        self.favorites = favorites
    }
}
