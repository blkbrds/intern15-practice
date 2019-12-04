//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class DetailViewModel {
    var place = Place()
    init() {}
    
    init(place: Place) {
        self.place = place
    }
}
