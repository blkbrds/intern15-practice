//
//  PostDetailViewModel.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class PostDetailViewModel {
    // MARK: - Properties
    let id: String
    let isFavorite: Bool
    let content: String
    let date: Date
    let title: String
    
    // MARK: - Init
    init(post: Post) {
        self.id = post.id
        self.title = post.title
        self.content = post.content
        self.isFavorite = post.isFavorite
        self.date = post.createDate
    }
}
