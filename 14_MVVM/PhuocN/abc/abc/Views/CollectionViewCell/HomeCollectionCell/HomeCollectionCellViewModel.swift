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
    
    init(title: String, image: String, distance: String, address: String, rating: String, isFavorite: Bool) {
        self.title = title
        self.image = image
        self.distance = distance
        self.address = address
        self.rating = rating
        self.isFavorite = isFavorite
    }
    
    func likeItem(completion: (Bool) -> ()) {
        isFavorite = true
        completion(true)
    }
    
    func unlike(completion: (Bool) -> ()) {
        isFavorite = false
        completion(true)
    }
}
