//
//  Tea.swift
//  CollectionView
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import UIKit

enum Team: Int {
    case avengers
    case guardians
    case xmen
    
    var teamName: String {
        switch self {
        case .avengers: return "Avengers"
        case .guardians: return "Guardians of galaxy"
        case .xmen: return "X-men"
        }
    }
    
    var teamAvatar: UIImage {
        switch self {
        case .avengers: return #imageLiteral(resourceName: "avengers")
        case .guardians: return #imageLiteral(resourceName: "guardians")
        case .xmen: return #imageLiteral(resourceName: "xmen")
        }
    }
    
    var members: [Member] {
        switch self {
        case .avengers: return [Member(name: "Thor", avatar: #imageLiteral(resourceName: "Thor")),
                                Member(name: "Iron Man", avatar: #imageLiteral(resourceName: "iron")),
                                Member(name: "Captain", avatar: #imageLiteral(resourceName: "captain")),
                                Member(name: "Black Panther", avatar: #imageLiteral(resourceName: "blackpather")),
                                Member(name: "Hawkeye", avatar: #imageLiteral(resourceName: "hawkeye")),
                                Member(name: "Hulk", avatar: #imageLiteral(resourceName: "hulk")),
                                Member(name: "Doctor Strange", avatar: #imageLiteral(resourceName: "doctor")),
                                Member(name: "Spider", avatar: #imageLiteral(resourceName: "spider"))]
        case .guardians: return [Member(name: "Star Lord", avatar: #imageLiteral(resourceName: "starlord")),
                                 Member(name: "Drax", avatar: #imageLiteral(resourceName: "drax")),
                                 Member(name: "Rocket", avatar: #imageLiteral(resourceName: "rocket")),
                                 Member(name: "Gamora", avatar: #imageLiteral(resourceName: "gamora")),
                                 Member(name: "Groot", avatar: #imageLiteral(resourceName: "groot"))]
        case .xmen: return [Member(name: "X-Professor", avatar: #imageLiteral(resourceName: "xprofessor")),
                            Member(name: "Wolverine", avatar: #imageLiteral(resourceName: "wolver")),
                            Member(name: "Magneto", avatar: #imageLiteral(resourceName: "magneto")),
                            Member(name: "Storm", avatar: #imageLiteral(resourceName: "storm")),
                            Member(name: "Jean", avatar: #imageLiteral(resourceName: "jean")),
                            Member(name: "Deadpool", avatar: #imageLiteral(resourceName: "deadpool"))]
        }
    }
}

