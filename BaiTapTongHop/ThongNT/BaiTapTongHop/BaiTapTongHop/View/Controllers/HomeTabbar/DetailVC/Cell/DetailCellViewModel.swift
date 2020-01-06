//
//  DetailCellViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/29/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class DetailCellViewModel {
    
    var avatar: String = ""
    var username: String = ""
    var description: String = ""
    var imageURLs: [String] = []
    
    init(avatar: String, username: String, description: String) {
        self.avatar = avatar
        self.username = username
        self.description = description
    }
    
    init(imageURLs: [String]) {
        self.imageURLs = imageURLs
    }
}
