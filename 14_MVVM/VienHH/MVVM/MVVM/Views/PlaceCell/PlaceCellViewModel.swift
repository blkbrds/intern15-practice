//
//  PlaceCellViewModel.swift
//  MVVM
//
//  Created by user on 1/22/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation

final class PlaceCellViewModel {

    var placeImageName: String
    var namePlace: String
    var address: String
    var rating: String
    var distance: String
    var isFavorites: Bool = false
    var favoritesImage: String {
        if isFavorites {
            return "icons8-heart-30"
        } else {
            return "icons8-heart-outline-30"
        }
    }

    init(namePlace: String, placeImageName: String, address: String, rating: String = "9/10", distance: String = "1,5Km", favorites: Bool) {
        self.placeImageName = placeImageName
        self.namePlace = namePlace
        self.address = address
        self.rating = rating
        self.distance = distance
        self.isFavorites = favorites
    }
}
