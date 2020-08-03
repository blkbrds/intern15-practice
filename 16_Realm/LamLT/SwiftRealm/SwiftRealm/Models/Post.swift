//
//  Post.swift
//  SwiftRealm
//
//  Created by PCI0002 on 5/13/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    @objc dynamic var postTitle: String = ""
    @objc dynamic var contentPost: String = ""
    @objc dynamic var datePost: String = ""
    @objc dynamic var owner: Category?
}
