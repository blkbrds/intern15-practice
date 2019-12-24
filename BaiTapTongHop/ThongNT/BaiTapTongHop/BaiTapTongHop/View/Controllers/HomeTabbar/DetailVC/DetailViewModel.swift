//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class DetailViewModel {
    
    var googlePlace = GooglePlace()
    var indexOfItem: Int = 0
    
    init() {}
    
    init(googlePlace: GooglePlace) {
        self.googlePlace = googlePlace
    }
}
