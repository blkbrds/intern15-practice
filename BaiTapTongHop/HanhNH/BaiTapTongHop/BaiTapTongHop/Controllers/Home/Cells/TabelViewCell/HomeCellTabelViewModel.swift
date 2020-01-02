//
//  HomeCellTabelViewModel.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/10/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
import UIKit

class HomeCellTabelViewModel {
    
    var watchers: Int
    var avatar: UIImage?
    var forks: Int
    var name: String
    var description: String
    
    init(repo: Repo) {
        self.watchers = repo.watchers_count
        self.avatar = repo.avatar
        self.forks = repo.forksCount
        self.name = repo.name
        self.description = repo.description
    }
}
