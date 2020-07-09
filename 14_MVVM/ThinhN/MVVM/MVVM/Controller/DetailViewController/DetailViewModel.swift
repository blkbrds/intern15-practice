//
//  DetailViewModel.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class DetailViewModel {
    private(set) var title: String
    private(set) var address: String
    private(set) var rating: Int
    private(set) var distance: String
    private(set) var imageName: String
    
    init(caffee: Caffee) {
        self.title = caffee.title
        self.address = caffee.address
        self.rating = caffee.rating
        self.distance = caffee.distance
        self.imageName = caffee.imageName
    }
}
