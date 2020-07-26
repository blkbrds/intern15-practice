//
//  HomeCellModel.swift
//  Bai3
//
//  Created by PCI0002 on 4/22/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

final class HomeCellViewModel {
    
    // MARK: - Properties
    var dataAPI: DataAPI = DataAPI()
    
    init(dataAPI: DataAPI = DataAPI()) {
        self.dataAPI = dataAPI
    }
}
