//
//  Team.swift
//  baitap4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import SwiftUI

struct Member {
    var name: String
    var avatar: UIImage
}

enum TeamType: Int {
    case pull
    case poodle
    case alaska

    var teamName: String {
        switch self {
        case .pull:
            return "Pull"
        case .poodle:
            return "Poodle"
        case .alaska:
            return "Alaska"
        }
    }

    var teamAvatar: UIImage {
        switch self {
        case .pull: return #imageLiteral(resourceName: "pull2")
        case .poodle: return #imageLiteral(resourceName: "poodle4")
        case .alaska: return #imageLiteral(resourceName: "alaska1")
        }
    }

    var members: [Member] {
        switch self {
        case .pull:
            return [
                Member(name: "pull1", avatar: #imageLiteral(resourceName: "pull4")),
                Member(name: "Pull2", avatar: #imageLiteral(resourceName: "pull3")),
                Member(name: "pull3", avatar: #imageLiteral(resourceName: "pull1")),
                Member(name: "pull4", avatar: #imageLiteral(resourceName: "pull6")),
                Member(name: "pull5", avatar: #imageLiteral(resourceName: "pull5"))]
        case .poodle:
            return [
                Member(name: "poodle1", avatar: #imageLiteral(resourceName: "poodle2")),
                Member(name: "poodle2", avatar: #imageLiteral(resourceName: "poodle1")),
                Member(name: "poodle3", avatar: #imageLiteral(resourceName: "poodle4")),
                Member(name: "poodle4", avatar: #imageLiteral(resourceName: "poodle6")),
                Member(name: "poodle5", avatar: #imageLiteral(resourceName: "poodle5"))]
        case .alaska:
            return [
                Member(name: "alaska1", avatar: #imageLiteral(resourceName: "alaska3")),
                Member(name: "alaska2", avatar: #imageLiteral(resourceName: "alaska2")),
                Member(name: "alaska3", avatar: #imageLiteral(resourceName: "alaska4")),
                Member(name: "alaska4", avatar: #imageLiteral(resourceName: "alaska6")),
                Member(name: "alaska5", avatar: #imageLiteral(resourceName: "alaska5"))]
        }
    }
    
    static var count: Int { return TeamType.alaska.rawValue + 1}
}

struct Team {
    var type: TeamType
    var members: [Member]
    var teamAvatar: UIImage

    init(type: TeamType) {
        self.type = type
        self.members = type.members
        self.teamAvatar = type.teamAvatar
    }
}


