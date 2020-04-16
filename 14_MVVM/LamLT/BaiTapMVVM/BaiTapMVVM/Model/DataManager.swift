//
//  DataManager.swift
//  BaiTapMVVM
//
//  Created by PCI0002 on 4/16/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

class DataManager {

    var name: String
    var image: String
    var address: String
    var range: String
    var rate: String
    var favorite: Bool

    init(name: String = "", image: String = "", address: String = "", range: String = "", rate: String = "", favorite: Bool = false) {
        self.name = name
        self.image = image
        self.address = address
        self.range = range
        self.rate = rate
        self.favorite = favorite
    }
}
