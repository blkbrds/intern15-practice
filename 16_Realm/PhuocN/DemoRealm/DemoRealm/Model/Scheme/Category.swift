//
//  Category.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/1/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import RealmSwift

final class Category: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var count: Int = 0
    var posts = List<Post>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
