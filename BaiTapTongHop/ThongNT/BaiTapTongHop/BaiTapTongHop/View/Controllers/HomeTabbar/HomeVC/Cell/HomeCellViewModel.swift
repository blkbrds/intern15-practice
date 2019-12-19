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
    var rating: Double
    let distance: Int
    var isFavorite: Bool = false
    var thumbnailImage: UIImage?
    var iconString: String
    var favoriteImage: String {
        if isFavorite {
            return "icon_heart_fill"
        }
        return "icon_heart"
    }

    init(googlePlace: GooglePlace) {
        title = googlePlace.name
        address = googlePlace.address
        rating = googlePlace.rating
        distance = googlePlace.distance
        isFavorite = googlePlace.favorite
        thumbnailImage = googlePlace.thumbnailImage
        iconString = googlePlace.iconString
    }
}
