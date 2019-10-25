//
//  HomeCollectionCellViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class HomeCollectionCellViewModel {
    
    private(set) var data: Location
    
    init(data: Location) {
        self.data = data
    }
    
    func likeItem() {
        data.isFavorite = true
    }
    
    func unlike() {
        data.isFavorite = false
    }
}
