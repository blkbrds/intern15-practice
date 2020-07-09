//
//  CustomTableViewModel.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class HomeCellViewModel {
    
    var title: String
    var address: String
    var rating: String
    var distance: String
    var imageName: String
    var isFavorite: Bool
    
    init(caffee: Caffee) {
        self.title = caffee.title
        self.address = caffee.address
        self.rating = ("\(caffee.rating)/10")
        self.distance = caffee.distance
        self.imageName = caffee.imageName
        self.isFavorite = caffee.isFavorite
    }
}
