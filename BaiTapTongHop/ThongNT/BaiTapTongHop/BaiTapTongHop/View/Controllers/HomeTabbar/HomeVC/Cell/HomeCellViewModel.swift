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
    var rating: String
    let distance: String
    var isFavorite: Bool = false
    var thumbnailImage: UIImage?
    var iconString: String
    var favoriteImage: UIImage {
        if isFavorite {
            return UIImage(named: "icon_heart_fill") ?? UIImage()
        }
        return UIImage(named: "icon_heart") ?? UIImage()
    }

    init(googlePlace: GooglePlace) {
        title = googlePlace.name
        address = googlePlace.address
        rating = String(googlePlace.rating)
        distance = "\(googlePlace.distance) m"
        thumbnailImage = googlePlace.thumbnailImage
        iconString = googlePlace.iconString
    }
}
