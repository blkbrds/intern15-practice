//
//  Category.swift
//  BaiTapDemoRealm
//
//  Created by Sếp Quân on 4/19/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import RealmSwift

final class Category: Object {
    // MARK: - Properties
    @objc dynamic var title = ""
    @objc dynamic var count = 0
    @objc dynamic var type = 0
    @objc dynamic var date = NSDate()
    var posts = List<Post>()
}

