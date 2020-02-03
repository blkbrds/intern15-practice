//
//  User.swift
//  Navigation
//
//  Created by user on 12/10/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import Foundation

final class User {
    var userName: String
    var password: String
    var avatarImageName: String

    init(userName: String, password: String, avatarImageName: String = "") {
        self.userName = userName
        self.avatarImageName = avatarImageName
        self.password = password
    }
}

