//
//  Comment.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

struct Comment  {
    var content: String
    var createdDate: Date
    var user: User
}
