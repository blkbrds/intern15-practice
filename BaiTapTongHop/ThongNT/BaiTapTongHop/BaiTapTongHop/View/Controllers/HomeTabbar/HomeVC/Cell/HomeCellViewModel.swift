//
//  HomeCellViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import MVVM

final class HomeCellViewModel: ViewModel {
    let title: String
    let address: String
    let rating: Int
    let distance: String
    let favorite: Bool
    let thumbnailImage: String
    
    init(place: Place) {
        title = place.title
        address = place.address
        rating = place.rating
        distance = place.distance
        favorite = place.favorite
        thumbnailImage = ""
    }
}
