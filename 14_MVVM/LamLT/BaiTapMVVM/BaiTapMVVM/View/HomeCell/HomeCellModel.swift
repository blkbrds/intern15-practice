//
//  HomeCellModel.swift
//  BaiTapMVVM
//
//  Created by PCI0002 on 4/16/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

final class HomeCellModel {

    var data: DataManager = DataManager()
    
    init(data: DataManager = DataManager()) {
        self.data = data
    }
}
