//
//  Comment.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

class Comment {
    var avatarImage: UIImage
    var name: String
    var content: String
    var createds: Date

    init(avatar: UIImage, name: String, status: String, created: Date) {
        self.avatarImage = avatar
        self.name = name
        self.content = status
        self.createds = created
    }
}
