//
//  CustomTableViewModel.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class HomeCellViewModel {
    
    var title: String
    var address: String
    var rating: String
    var distance: String
    var imageName: String
    var isFavorite: Bool
    
    init(cafe: CoffeeShop) {
        title = cafe.title
        address = cafe.address
        rating = ("\(cafe.rating)/10")
        distance = ("\(cafe.distance)/km")
        imageName = cafe.imageName
        isFavorite = cafe.isFavorite
    }
}
