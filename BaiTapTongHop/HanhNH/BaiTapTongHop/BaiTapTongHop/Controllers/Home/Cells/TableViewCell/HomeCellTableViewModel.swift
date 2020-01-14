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
    var descriptionName: String

    init(repo: Repository) {
        self.numberOfWatchers = repo.watchersCount
        self.numberOfForks = repo.forksCount
        self.name = repo.nameApp
        self.descriptionName = repo.descriptionName
        if let repo = repo.avatarImage {
            self.avatarImage = UIImage(data: repo)
        }
    }
}
