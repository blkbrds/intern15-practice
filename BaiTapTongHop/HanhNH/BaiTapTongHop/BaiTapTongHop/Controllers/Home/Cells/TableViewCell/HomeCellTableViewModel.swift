//
//  HomeCellTableViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class HomeCellTableViewModel {

    var numberOfWatchers: Int
    var avatarImage: UIImage?
    var numberOfForks: Int
    var name: String
    var descriptionName: String

    init(user: User) {
        self.numberOfWatchers = user.numberOfWatchers
        self.numberOfForks = user.numberOfForks
        self.name = user.name
        self.descriptionName = user.descriptionName
        if let repo = user.avatarName {
            self.avatarImage = UIImage(named: repo)
        }
    }
}
