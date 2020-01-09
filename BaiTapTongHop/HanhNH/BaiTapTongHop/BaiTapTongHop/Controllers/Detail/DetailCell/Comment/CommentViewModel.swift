//
//  CommentViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class CommentViewModel {
    
    var image: UIImage
    var status: String
    var name: String
    var day: Date
    
    init(image: UIImage, status: String, name: String, day: Date) {
        self.image = image
        self.status = status
        self.name = name
        self.day = Date()
    }
}
