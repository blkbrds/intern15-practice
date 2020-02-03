//
//  FavoriteCellViewModel.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 2/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class FavoriteCellViewModel {
    
    var watcherCount: Int
    var forksCount: Int
    var description: String
    var name: String
    var avatar: UIImage?
    
    init(repo: Repository) {
        self.watcherCount = repo.watchersCount
        self.forksCount = repo.forksCount
        self.description = repo.descriptionName
        self.name = repo.nameApp
        if let repo = repo.avatarImage {
            self.avatar = UIImage(data: repo)
        }
    }
}
