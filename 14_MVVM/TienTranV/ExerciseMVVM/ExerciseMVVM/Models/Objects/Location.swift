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
    var imageName: String
    var rate: String
    var distance: String
    var favorites: Bool
    
    init(name: String, address: String, imageName: String, rate: String = "8/10", distance: String = "8km",  favorites: Bool = false) {
        self.name = name
        self.address = address
        self.imageName = imageName
        self.rate = rate
        self.distance = distance
        self.favorites = favorites
    }
}
