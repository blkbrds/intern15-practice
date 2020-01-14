//
//  DummyData.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import RealmSwift

struct DummyData {

    static var userLong: User = {
        let user = User()
        user.id = "1"
        user.name = "Long"
        user.avatarName = "2"
        user.descriptionName = ""
        return user
    }()

    static var userNam: User = {
        let user = User()
        user.id = "2"
        user.name = "Nam"
        user.avatarName = "3"
        user.descriptionName = ""
        return user
    }()

    static var userVinh: User = {
        let user = User()
        user.id = "3"
        user.name = "Vinh"
        user.avatarName = "4"
        user.descriptionName = ""
        return user
    }()

    static var comments: [Comment] {
        var comments: [Comment] = []
        let comment1 = Comment()
        comment1.content = "Aasdasd"
        comment1.createdDate = Date()
        comment1.user = userNam
        comments.append(comment1)
        
        let coment2 = Comment()
        coment2.content = "asdada"
        coment2.createdDate = Date()
        coment2.user = userLong
        comments.append(coment2)
        
        let coment3 = Comment()
        coment3.content = "asdada"
        coment3.createdDate = Date()
        coment3.user = userNam
        comments.append(coment3)
        
        return comments
    }
}
