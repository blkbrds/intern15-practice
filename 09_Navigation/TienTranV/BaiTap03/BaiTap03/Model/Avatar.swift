//
//  Avatar.swift
//  BaiTap03
//
//  Created by TranVanTien on 11/28/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class Avatar {
    var avatarImageName: String
    var avatarName: String
    
    init(avatarName: String, avatarImageName: String) {
        self.avatarImageName = avatarImageName
        self.avatarName = avatarName
    }
}
