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
    let rating: String
    let distance: String
    let favorite: Bool
    let thumbnailImage: String
    var favoriteImage: String {
        if favorite {
            return "icon_heart_fill"
        }
        return "icon_heart"
    }

    init(place: Place) {
        title = place.title
        address = place.address
        rating = place.rating
        distance = place.distance
        favorite = place.favorite
        thumbnailImage = ""
    }

//    func favoriteImage() -> String {
//        if favorite {
//            return "icon_heart_fill"
//        }
//        return "icon_heart"
//    }
}
