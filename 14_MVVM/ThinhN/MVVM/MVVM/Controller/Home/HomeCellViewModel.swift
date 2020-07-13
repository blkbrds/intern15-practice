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
    
    init(cafe: Cafe) {
        self.title = cafe.title
        self.address = cafe.address
        self.rating = ("\(cafe.rating)/10")
        self.distance = cafe.distance
        self.imageName = cafe.imageName
        self.isFavorite = cafe.isFavorite
    }
}
