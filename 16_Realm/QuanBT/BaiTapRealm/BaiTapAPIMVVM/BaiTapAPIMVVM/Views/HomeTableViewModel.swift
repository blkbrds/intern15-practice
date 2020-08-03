//
//  HomeTableViewModel.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeTableViewModel {
    // MARK: - Properties
    var dataAPI: DataAPI = DataAPI()
    
    // MARK: - Init
    init(dataAPI: DataAPI = DataAPI()) {
        self.dataAPI = dataAPI
    }
}
