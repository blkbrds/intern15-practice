//
//  Repository.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

class Repository {

    var avatarUrl: String = ""
    var nameApp: String = ""
    var createdAt: String = ""
    var watchersCount: Int = 0
    var avatarImage: UIImage?
    var forksCount: Int = 0
    var descriptionName: String = ""

    init(json: JSON) {
        if let json = json["created_at"] as? String {
            self.createdAt = json
        }
        if let watchersCount = json["watchers_count"] as? Int {
            self.watchersCount = watchersCount
        }
        if let descriptionName = json["description"] as? String {
            self.descriptionName = descriptionName
        }
        if let forksCount = json["forks_count"] as? Int {
            self .forksCount = forksCount
        }
        if let owner = json["owner"] as? JSON {
            if let nameApp = owner["login"] as? String {
                self.nameApp = nameApp
            }
            if let avatarUrl = owner["avatar_url"] as? String {
                self .avatarUrl = avatarUrl
            }
        }
    }
}
