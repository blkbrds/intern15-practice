//
//  CommentViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

struct CommentViewModel {
    
    var comment: Comment
}

extension CommentViewModel {

    var userName: String {
        return comment.user.name
    }
    
    var contentComment: String {
        return comment.content
    }
    
    var avatar: String {
        return comment.user.avatarPath
    }
    
    var created: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: comment.createds)
    }
}
