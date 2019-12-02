//
//  DetailCellViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/29/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class DetailCellViewModel {
    let avatar: String
    let username: String
    let description: String
    
    init(avatar: String, username: String, description: String) {
        self.avatar = avatar
        self.username = username
        self.description = description
    }
}
