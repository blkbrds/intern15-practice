//
//  Repository.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

@objcMembers class Repository: Object {
    
    dynamic var isFavorite: Bool = false
    dynamic var id: Int = 0
    dynamic var avatarUrl: String = ""
    dynamic var nameApp: String = ""
    dynamic var createdAt: String = ""
    dynamic var watchersCount: Int = 0
    var avatarImage: Data?
    dynamic var forksCount: Int = 0
    dynamic var descriptionName: String = ""

    init(json: JSON) {
        if let json = json["created_at"] as? String {
            self.createdAt = json
        }
        
        if let idReprository = json["id"] as? Int {
            self.id = idReprository
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
    
    override static func primaryKey() -> String? {
      return "id"
    }
    
    required init() { }
}
