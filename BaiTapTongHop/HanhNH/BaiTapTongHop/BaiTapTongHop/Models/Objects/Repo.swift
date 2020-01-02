//
//  Repo.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 12/31/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
import UIKit
class Repo {
    var avatarUrl: String
    var name: String
    var created_at: String
    var watchers_count: Int
    var avatar: UIImage?
    var forksCount: Int
    var description: String

    init(json: JSON) {
        self.created_at = json["created_at"] as! String
        self.watchers_count = json["watchers_count"] as! Int
        self.description = json["description"] as! String
        self.forksCount = json["forks_count"] as! Int
        let owner = json["owner"] as! JSON
        self.name = owner["login"] as! String
        self.avatarUrl = owner["avatar_url"] as! String
    }
}
