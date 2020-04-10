//
//  DetailCellModel.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/10/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class DetailCellModel {
    // MARK: - Properties
    var dataDetail: DataDetail = DataDetail()
    
    // MARK: - Init
    init(dataDetail: DataDetail = DataDetail()) {
        self.dataDetail = dataDetail
    }
}
