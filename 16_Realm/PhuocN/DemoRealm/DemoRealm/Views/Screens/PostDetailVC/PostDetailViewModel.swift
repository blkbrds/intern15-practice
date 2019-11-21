//
//  PostDetailViewModel.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

final class PostDetailViewModel {
    
    let id: String
    let isFavorite: Bool
    let content: String
    let date: Date
    let title: String
    
    init(post: Post) {
        self.id = post.id
        self.title = post.title
        self.content = post.content
        self.isFavorite = post.isFavorite
        self.date = post.createDate
    }
}
