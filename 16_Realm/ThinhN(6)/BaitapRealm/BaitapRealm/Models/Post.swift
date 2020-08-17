//
//  Post.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/15/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var createdDate: String = ""
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var owner: Category?

}

