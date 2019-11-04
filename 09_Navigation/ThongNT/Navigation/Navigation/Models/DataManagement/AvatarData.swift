//
//  Avatar.swift
//  Navigation
//
//  Created by PCI0018 on 11/1/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import Foundation

final class AvatarData {

    var name: String = ""
    var avatarString: String = ""

    init() { }

    init(username: String, avatarString: String) {
        name = username
        self.avatarString = avatarString
    }
}

extension AvatarData {
    static func parseData(array: [Dictionary<String, String>]) -> [AvatarData] {
        var users: [AvatarData] = []

        for dic in array {
            if let username = dic["name"], let avatarString = dic["avatarString"] {
                let user = AvatarData(username: username, avatarString: avatarString)
                users.append(user)
            }
        }
        return users
    }
}
