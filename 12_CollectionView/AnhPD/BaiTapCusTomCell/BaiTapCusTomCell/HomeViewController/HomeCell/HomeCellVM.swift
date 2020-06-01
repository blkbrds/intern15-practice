//
//  HomeCellVM.swift
//  BaiTapCusTomCell
//
//  Created by PCI0012 on 5/21/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

class HomeCellVM {
    var avatarName: String
    var nameTitle: String
    var address: String
    
    init(avatarName: String, nameTiltle: String, address: String) {
        self.avatarName = avatarName
        self.nameTitle = nameTiltle
        self.address = address
    }
}
