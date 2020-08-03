//
//  Post.swift
//  BaiTapDemoRealm
//
//  Created by Sếp Quân on 4/20/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import RealmSwift

final class Post: Object {
    @objc dynamic var content: String = ""
    @objc dynamic var createDate = NSDate()
    @objc dynamic var title: String = ""
    @objc dynamic var isFavorite: Bool = false
}
