//
//  GitFavoritesCellModel.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit

final class GitFavoritesCellModel {
    var url: String
    var login: String
    var type: String
    var thumbnailImage: UIImage?
    
    init(git: GitRealm) {
        self.url = git.url
        self.login = git.login
        self.type = git.type
    }
}
