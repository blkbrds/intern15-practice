//
//  DataManager.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/9/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class DataManager {
    // MARK: - Properties
    var name: String
    var image: String
    var address: String
    var range: String
    var rate: String
    
    // MARK: - Init
    init(name: String = "", image: String = "", address: String = "", range: String = "", rate: String = "") {
        self.name = name
        self.image = image
        self.address = address
        self.range = range
        self.rate = rate
    }
}
