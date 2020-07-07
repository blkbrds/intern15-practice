//
//  Caf.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

class Caffee {
    var title: String
    var address: String
    var rating: String
    var distance: String
    var imageName: String
    var isFavorite: Bool
    init(title: String, address: String, rating: String, distance: String, imageName: String, isFavorite: Bool = false) {
        self.title = title
        self.address = address
        self.rating = rating
        self.distance = distance
        self.imageName = imageName
        self.isFavorite = isFavorite
    }
}
