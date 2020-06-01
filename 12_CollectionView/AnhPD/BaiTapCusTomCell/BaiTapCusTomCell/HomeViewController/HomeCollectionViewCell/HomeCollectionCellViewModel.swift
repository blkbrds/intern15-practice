//
//  HomeCollectionCellViewModel.swift
//  BaiTapCusTomCell
//
//  Created by PCI0012 on 5/28/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

class HomeCollectionCellViewModel {
    var nameTitle: String
    var avatarName: String
    var address: String
    
    init(nameTitle: String, avatarName: String, address: String) {
        self.nameTitle = nameTitle
        self.avatarName = avatarName
        self.address = address
    }
}
