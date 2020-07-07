//
//  HomeCellModel.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/9/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeCellModel {
    // MARK: - Properties
    var data: DataManager = DataManager()
    
    // MARK: - Init
    init(data: DataManager = DataManager()) {
        self.data = data
    }
}
