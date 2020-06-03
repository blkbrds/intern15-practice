
//
//  HomeCellModel.swift
//  BaiTapMVVM
//
//  Created by PCI0012 on 6/2/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

class HomeCellViewModel {
    var cafes: Cafe
    var isFavorite = false
    
    init(cafes: Cafe) {
        self.cafes = cafes
    }
}
