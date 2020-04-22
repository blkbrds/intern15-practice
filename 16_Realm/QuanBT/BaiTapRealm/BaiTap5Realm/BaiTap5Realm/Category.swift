//
//  Category.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import RealmSwift

final class Category: Object {
    // MARK: - Properties
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var createDate: Date = Date()
    @objc dynamic var count: Int = 0
    var posts = List<Post>()
    
    // MARK: - PrimaryKey
    override class func primaryKey() -> String? {
        return "id"
    }
}
