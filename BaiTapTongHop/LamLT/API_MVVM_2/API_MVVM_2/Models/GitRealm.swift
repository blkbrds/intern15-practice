//
//  GitRealm.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/9/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import RealmSwift

class GitRealm: Object {
    @objc dynamic var id = 0
    @objc dynamic var login = ""
    @objc dynamic var type = ""
    @objc dynamic var url = ""
    @objc dynamic var avatarURL = ""

    @objc dynamic var isFavoties = false

    override static func primaryKey() -> String? {
        return "id"
    }
}
