//
//  User.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
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
