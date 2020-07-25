//
//  DetailViewModel.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class DetailViewModel {
    private(set) var title: String
    private(set) var address: String
    private(set) var rating: Int
    private(set) var distance: Double
    private(set) var imageName: String
    
    init(cafe: CoffeeShop) {
        title = cafe.title
        address = cafe.address
        rating = cafe.rating
        distance = cafe.distance
        imageName = cafe.imageName
    }
}
