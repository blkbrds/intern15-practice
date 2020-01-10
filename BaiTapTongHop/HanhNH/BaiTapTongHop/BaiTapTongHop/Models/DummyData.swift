//
//  DummyData.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

struct DummyData {
    
    static var userLong: User = User(id: "1", name: "Long", avatarPath: "2",
                                     coverImages: [], description: "", comments: [])
    
    static var userNam: User = User(id: "2", name: "Nam", avatarPath: "3",
                             coverImages: [], description: "", comments: [])
    
    static var userVinh: User = User(id: "3", name: "Vinh", avatarPath: "1",
                              coverImages: ["1", "2", "3"],
                              description: "", comments: comments)

    
    static var comments: [Comment] {
        var comments: [Comment] = []
        comments.append(Comment(content: "Aasdasd", createds: Date(), user: userLong))
        comments.append(Comment(content: "Aasdasd", createds: Date(), user: userLong))
        comments.append(Comment(content: "Aasdasd", createds: Date(), user: userLong))
        comments.append(Comment(content: "Aasdasd", createds: Date(), user: userNam))
        return comments
    }
} 