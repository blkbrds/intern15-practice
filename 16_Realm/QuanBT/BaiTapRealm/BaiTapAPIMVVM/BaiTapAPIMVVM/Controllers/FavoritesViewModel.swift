//
//  FavoritesViewModel.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class FavoritesViewModel {
    var dataAPIs: [DataAPI] = []
    
    
    func numberOfRowInSection() -> Int {
        return dataAPIs.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeTableViewModel {
        let item = dataAPIs[indexPath.row]
        let viewModel = HomeTableViewModel(dataAPI: item)
        return viewModel
    }
}
