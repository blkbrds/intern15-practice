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

final class Comment: Object {
    @objc dynamic var content: String = ""
    @objc dynamic var createdDate: Date = Date()
    @objc dynamic var user: User?
}
