//
//  HomeCellModel.swift
//  BaiTest
//
//  Created by Sếp Quân on 4/29/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeCellModel {
    // MARK: - Properties
    var data: DataTest = DataTest()
    
    // MARK: - Init
    init(data: DataTest = DataTest()) {
        self.data = data
    }
}
