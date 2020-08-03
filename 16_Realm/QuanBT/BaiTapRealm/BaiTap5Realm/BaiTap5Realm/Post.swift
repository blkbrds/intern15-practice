//
//  Post.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    // MARK: - Properties
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var content: String = ""
    @objc dynamic var createDate: Date = Date()
    @objc dynamic var title: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    // MARK: - PrimaryKey
    override class func primaryKey() -> String? {
        return "id"
    }
}
