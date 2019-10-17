//
//  User.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

class User {
    var userName: String
    var password: String
    var avatarImageName: String
    
    init(userName: String, password: String, avatarImageName: String = "") {
        self.userName = userName
        self.avatarImageName = avatarImageName
        self.password = password
    }
}
