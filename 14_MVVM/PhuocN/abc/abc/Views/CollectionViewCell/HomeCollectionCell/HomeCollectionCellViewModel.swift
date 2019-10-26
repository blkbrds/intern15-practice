//
//  HomeCollectionCellViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class HomeCollectionCellViewModel {

    var title: String
    var image: String
    var distance: String
    var address: String
    var isFavorite: Bool
    var rating: String
    
    init(place: Place) {
        self.title = place.name
        self.image = place.avatar
        self.distance = place.distance
        self.address = place.address
        self.rating = place.rates
        self.isFavorite = place.isFavorite
    }
    
    func setFavorite(completion: (Bool) -> ()) {
//        if isFavorite {
//            isFavorite = false
//        } else {
//            isFavorite = true
//        }
        isFavorite = isFavorite ? false : true
        completion(true)
    }
}
