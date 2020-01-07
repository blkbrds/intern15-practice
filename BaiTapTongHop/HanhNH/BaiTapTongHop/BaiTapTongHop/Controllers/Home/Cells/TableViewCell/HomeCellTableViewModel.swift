//
//  HomeCellTableViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
class HomeCellTableViewModel {
    var watchers: Int
    var avatar: UIImage?
    var forks: Int
    var name: String
    var description: String

    init(repo: Repo) {
        self.watchers = repo.watchersCount
        self.avatar = repo.avatarImage
        self.forks = repo.forksCount
        self.name = repo.nameApp
        self.description = repo.description
    }
}
