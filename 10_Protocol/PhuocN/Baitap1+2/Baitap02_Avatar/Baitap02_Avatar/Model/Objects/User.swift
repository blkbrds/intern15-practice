//
//  User.swift
//  Baitap02_Avatar
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class User {
    var username: String
    var password: String
    var avatarImageName: String
    
    init(username: String, password: String, avatarImageName: String = "") {
        self.username = username
        self.avatarImageName = avatarImageName
        self.password = password
    }
}
