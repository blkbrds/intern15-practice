//
//  Home.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/5/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import Foundation

final class Home {
    var image: String
    var name: String
    var address: String
    var rating: String
    var distance: String
    var isLiked: Bool
    
    init(image: String, name: String, address: String, rating: String, distance: String, isLiked: Bool) {
        self.image = image
        self.name = name
        self.address = address
        self.rating = rating
        self.distance = distance
        self.isLiked = isLiked
    }
}
