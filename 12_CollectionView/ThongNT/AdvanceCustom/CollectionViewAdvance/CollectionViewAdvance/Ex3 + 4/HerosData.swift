//
//  HerosData.swift
//  CollectionViewAdvance
//
//  Created by PCI0018 on 11/18/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

struct Member {
    let name: String
    let avatar: UIImage
}

enum Team: Int {
    case avengers
    case guardians
    case xmen

    var teamName: String {
        switch self {
        case .avengers:
            return "Avengers"
        case .guardians:
            return "Guardians of Galaxy"
        case .xmen:
            return "X men"
        }
    }

    var teamAvatar: UIImage {
        switch self {
        case .avengers:
            return #imageLiteral(resourceName: "team_avengers_img")
        case .guardians:
            return #imageLiteral(resourceName: "team_guardians_img")
        case .xmen:
            return #imageLiteral(resourceName: "team_x_men_img")
        }
    }

    var members: [Member] {
        switch self {
        case .avengers:
            return [Member(name: "Thor", avatar: #imageLiteral(resourceName: "thor_img.jpg")),
                Member(name: "Iron Man", avatar: #imageLiteral(resourceName: "iron_man_img.jpg")),
                Member(name: "Caption America", avatar: #imageLiteral(resourceName: "captain_img.jpg"))]
        case .guardians:
            return [Member(name: "Star Lord", avatar: #imageLiteral(resourceName: "star_lord_img.jpg")),
                Member(name: "Rocket Racoon", avatar: #imageLiteral(resourceName: "rocket_racoon_img.jpg")),
                Member(name: "Groot", avatar: #imageLiteral(resourceName: "groot_img.jpg"))]
        case .xmen:
            return [Member(name: "Storm", avatar: #imageLiteral(resourceName: "storm_img.jpg")),
                Member(name: "Beast", avatar: #imageLiteral(resourceName: "beast_img.png")),
                Member(name: "Wolverine", avatar: #imageLiteral(resourceName: "wolverine_img.png"))]
        }
    }
    static var count: Int { return Team.xmen.rawValue + 1 }
}
