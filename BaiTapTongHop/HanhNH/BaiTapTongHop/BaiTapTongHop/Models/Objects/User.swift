//
//  User.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class User: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var avatarName: String?
    var coverImageNames = List<String>()
    @objc dynamic var descriptionName: String = ""
    var comments = List<Comment>()
    @objc var numberOfWatchers: Int = 0
    @objc var numberOfForks: Int = 0

    override static func primaryKey() -> String? {
        return "id"
    }
}
