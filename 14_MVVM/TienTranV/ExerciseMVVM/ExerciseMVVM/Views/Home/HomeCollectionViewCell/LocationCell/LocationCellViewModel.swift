//
//  LocationCellViewModel.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class LocationCellViewModel {

    var locationImageName: String
    var nameLocation: String
    var address: String
    var rating: String
    var distance: String
    var favorites: Bool

    init(nameLocation: String, locationImageName: String, address: String, rating: String = "8/10", distance: String = "3km", favorites: Bool = false) {
        self.locationImageName = locationImageName
        self.nameLocation = nameLocation
        self.address = address
        self.rating = rating
        self.distance = distance
        self.favorites = favorites
    }
}
