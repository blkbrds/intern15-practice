//
//  Repository.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

class Repository {
    var avatarUrl: String
    var nameApp: String
    var createdAt: String
    var watchersCount: Int
    var avatarImage: UIImage?
    var forksCount: Int
    var description: String

    init(json: JSON) {
        self.createdAt = json["created_at"] as! String
        self.watchersCount = json["watchers_count"] as! Int
        self.description = json["description"] as! String
        self.forksCount = json["forks_count"] as! Int
        let owner = json["owner"] as! JSON
        self.nameApp = owner["login"] as! String
        self.avatarUrl = owner["avatar_url"] as! String
    }
}

