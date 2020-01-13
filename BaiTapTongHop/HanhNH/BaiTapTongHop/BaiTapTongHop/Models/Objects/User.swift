//
//  User.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

struct User {
    var id: String = ""
    var name: String = ""
    var avatarName: String = ""
    var coverImageNames: [String] = []
    var description: String = ""
    var comments: [Comment] = []
}
