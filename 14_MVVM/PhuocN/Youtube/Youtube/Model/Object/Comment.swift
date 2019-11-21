//
//  Comment.swift
//  abc
//
//  Created by PhuocNguyen on 11/5/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class Comment {
    var id: String
    var textDisplay: String
    var likeCount: Int
    var publishedAt: String
    var updatedAt: String
    var authorProfileImageUrl: String
    var authorDisplayName: String
    
    init(dict: [String: Any]) {
        self.id = dict["id"] as? String ?? ""
        self.likeCount = dict["id"] as? Int ?? 0
        self.publishedAt = dict["publishedAt"] as? String ?? ""
        self.updatedAt = dict["updatedAt"] as? String ?? ""
        self.authorProfileImageUrl = dict["authorProfileImageUrl"] as? String ?? ""
        self.authorDisplayName = dict["authorDisplayName"] as? String ?? ""
        self.textDisplay = dict["textDisplay"] as? String ?? ""
    }
}
