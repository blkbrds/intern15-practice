//
//  HomeTableViewModel.swift
//  BaiTap5API
//
//  Created by Sếp Quân on 4/14/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeCellViewModel {
    // MARK: - Properties
    var dataAPI: DataAPI = DataAPI()
    
    init(dataAPI: DataAPI = DataAPI()) {
        self.dataAPI = dataAPI
    }
}
