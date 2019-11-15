//
//  Post.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var content: String = ""
    @objc dynamic var createDate: Date = Date()
    @objc dynamic var title: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
