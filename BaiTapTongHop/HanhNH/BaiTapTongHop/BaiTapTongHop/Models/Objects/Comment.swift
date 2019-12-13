//
//  User.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/11/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class Comment {
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

extension Comment {
    static func getDummyDatas() -> [Comment] {
        var users: [Comment] = []
        for i in 1...20 {
            switch i {
            case 1...3:
                let user = Comment(avatar: UIImage(named: "ic-image-hanh")!, name: "NGUYEN HONG HANH", status: "orem Ipsum is simply dummy text of the printing and typesetting industry. ", created: Date())
                users.append(user)
            case 4...9:
                let user = Comment(avatar: UIImage(named: "ic-image-hanh")!, name: "NGUYEN HONG HANH", status: "tham gia vào intern khoá 15 của công ty AseanTech, đang học và làm việc tại môi trường làm việc lớn.  ", created: Date())
                users.append(user)
            case 10...13:
                let user = Comment(avatar: UIImage(named: "ic-image-hanh")!, name: "NGUYEN HONG HANH", status: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", created: Date())
                users.append(user)
            default:
                let user = Comment(avatar: UIImage(named: "ic-image-hanh")!, name: "NGUYEN HONG HANH", status: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", created: Date())
                users.append(user)
            }
        }
        return users
    }
}
