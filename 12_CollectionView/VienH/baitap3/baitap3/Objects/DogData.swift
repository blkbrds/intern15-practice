//
//  DogData.swift
//  baitap3+4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import SwiftUI

struct Member {
    let name: String
    let avatar: UIImage
}

enum TeamType: Int, CaseIterable {
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
        case .pull:
            return #imageLiteral(resourceName: "pull4")
        case .poodle:
            return #imageLiteral(resourceName: "poodle4")
        case .alaska:
            return #imageLiteral(resourceName: "alaska4")
        }
    }
    var members: [Member] {
        switch self {
        case .pull:
            return [Member(name: "pull1", avatar: #imageLiteral(resourceName: "pull1")), Member(name: "pull2", avatar: #imageLiteral(resourceName: "pull2")), Member(name: "pull3", avatar: #imageLiteral(resourceName: "pull3"))]
        case .poodle:
            return [Member(name: "poodle1", avatar: #imageLiteral(resourceName: "poodle1")), Member(name: "poodle2", avatar: #imageLiteral(resourceName: "poodle2")), Member(name: "poodle3", avatar: #imageLiteral(resourceName: "poodle3"))]
        case .alaska:
            return [Member(name: "alaska1", avatar: #imageLiteral(resourceName: "alaska1")), Member(name: "alaska2", avatar: #imageLiteral(resourceName: "alaska2")), Member(name: "alaska3", avatar: #imageLiteral(resourceName: "alaska3"))]
        }
    }
    static var count: Int { return TeamType.alaska.rawValue}
}
