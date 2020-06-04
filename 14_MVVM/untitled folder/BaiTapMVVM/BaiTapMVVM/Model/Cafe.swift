
//
//  Cafes.swift
//  BaiTapMVVM
//
//  Created by PCI0012 on 6/2/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

final class Cafe {
    var avatarName: String
    var nameTitle: String
    var address: String
    var km: String
    var isFavorite: Bool
    
    init(avatarName: String = "", nameTitle: String = "", address: String = "", km: String = "", favorite: Bool = false) {
        self.avatarName = avatarName
        self.nameTitle = nameTitle
        self.address = address
        self.km = km
        self.isFavorite = favorite
    }
}
