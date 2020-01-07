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
    var numberOfWatchers: Int
    var avatarImage: UIImage?
    var numberOfForks: Int
    var name: String
    var description: String

    init(repo: Repo) {
        self.numberOfWatchers = repo.watchersCount
        self.avatarImage = repo.avatarImage
        self.numberOfForks = repo.forksCount
        self.name = repo.nameApp
        self.description = repo.description
    }
}
