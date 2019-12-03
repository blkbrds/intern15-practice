//
//  HeroData.swift
//  BaiTap12-collectionView
//
//  Created by ANH NGUYỄN on 11/30/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

struct MemBer {
    let name: String
    let avatar: UIImage
}

enum Team: Int {
    case gokugod
    case gokublue
    case gokuultrainstinct
    
    var teamName: String {
        switch self {
        case .gokugod:
            return "GoKu super saiyan god"
        case .gokublue:
            return "GoKu super saiyan blue"
        case .gokuultrainstinct:
            return "GoKu super saiyan ultrainstinct"
        }
    }
    var teamAvatar: UIImage {
        switch self {
        case .gokugod:
            return #imageLiteral(resourceName: "gokugod3")
        case .gokublue:
            return #imageLiteral(resourceName: "gokublue5")
        case .gokuultrainstinct:
            return #imageLiteral(resourceName: "goku6")
        }
    }
    var members: [MemBer] {
        switch self {
        case .gokugod:
            return [MemBer(name: "goku god", avatar: #imageLiteral(resourceName: "gokugod1")), MemBer(name: "goku saiyan god", avatar: #imageLiteral(resourceName: "gokugod1")), MemBer(name: "goku super god", avatar: #imageLiteral(resourceName: "gokugod2")), MemBer(name: "goku super saiyan god", avatar: #imageLiteral(resourceName: "gokugod3")), MemBer(name: "goku super saiyan god hoàn thiện", avatar: #imageLiteral(resourceName: "gokugod4"))]
        case .gokublue:
            return [MemBer(name: "goku blue", avatar: #imageLiteral(resourceName: "goku4")), MemBer(name: "goku saiyan blue", avatar: #imageLiteral(resourceName: "gokublue2")), MemBer(name: "goku super blue", avatar: #imageLiteral(resourceName: "gokublue5")), MemBer(name: "goku super saiyan blue", avatar: #imageLiteral(resourceName: "gokublue3")), MemBer(name: "goku super saiyan blue", avatar: #imageLiteral(resourceName: "gokublue3"))]
        case .gokuultrainstinct:
            return [MemBer(name: "goku ultrainstinct", avatar: #imageLiteral(resourceName: "goku6")), MemBer(name: "goku saiyan ultrainstinct", avatar: #imageLiteral(resourceName: "gokubnvc3")), MemBer(name: "goku ultrainstinct", avatar: #imageLiteral(resourceName: "goku2")), MemBer(name: "goku super ultrainstinct", avatar: #imageLiteral(resourceName: "gokubnvc6")), MemBer(name: "goku ultrainstinct", avatar: #imageLiteral(resourceName: "goku2")), MemBer(name: "goku super saiyan blue", avatar: #imageLiteral(resourceName: "gokubnvc3")), MemBer(name: "goku ultrainstinct hoàn thiện", avatar: #imageLiteral(resourceName: "gokubnvc5"))]
        }
    }
    static var count: Int {return Team.gokuultrainstinct.hashValue + 1}
    
    static var teamMembers: [Team] = [.gokublue, .gokugod, .gokuultrainstinct]
}
