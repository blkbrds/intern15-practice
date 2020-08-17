//
//  Category.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/15/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    let posts = List <Post>()
}
