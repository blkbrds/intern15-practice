//
//  Book.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/3/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class Book: Object {
    @objc dynamic var title = ""
    @objc dynamic var subTitle = ""
    @objc dynamic var price = 0
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
