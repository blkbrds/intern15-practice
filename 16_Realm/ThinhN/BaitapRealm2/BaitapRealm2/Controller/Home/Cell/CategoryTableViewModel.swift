//
//  CategoryTableViewModel.swift
//  BaitapRealm2
//
//  Created by ADMIN on 8/5/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

class CategoryTableViewModel {
    var postTitle: String = ""
    var contentPost: String = ""
    var dateTimePost: String = ""
    var isFavorite: Bool
    
    init(post: Post ) {
        contentPost = post.content
        dateTimePost = post.createDate
        postTitle = post.title
        isFavorite = post.isFavorite
    }
}
