//
//  Post.swift
//  BaitapRealm2
//
//  Created by ADMIN on 8/5/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var createDate: String = ""
    @objc dynamic var isFavorite = true
    @objc dynamic var owner: Category?
    
}
