//
//  ProfileData.swift
//  Protocol
//
//  Created by PCI0018 on 11/5/19.
//

import Foundation

final class ProfileData {

    var name: String = ""
    var avatarString: String = ""

    init() { }

    init(name: String, avatarString: String) {
        self.name = name
        self.avatarString = avatarString
    }
}

extension ProfileData {
    static func parseData(array: [Dictionary<String, String>]) -> [ProfileData] {
        var profiles: [ProfileData] = []

        for dic in array {
            if let name = dic["name"], let avatarString = dic["avatarString"] {
                let profile = ProfileData(name: name, avatarString: avatarString)
                profiles.append(profile)
            }
        }
        return profiles
    }
}
