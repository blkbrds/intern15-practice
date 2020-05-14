//
//  PostCellViewModel.swift
//  SwiftRealm
//
//  Created by PCI0002 on 5/13/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

class PostCellViewModel {
    var postTitle: String = ""
    var contentPost: String = ""
    var datePost: String = ""
    
    init() {}
    
    init(post: Post) {
        postTitle = post.postTitle
        contentPost = post.contentPost
        datePost = post.datePost
    }
}
