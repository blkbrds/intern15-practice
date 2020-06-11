//
//  FavoritesCellViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit

class FavoritesCellViewModel {
    var name: String
    var loign: String
    var type: String
    var thumbnailImage: UIImage?
    
    init(repo: RepoRealm) {
        self.name = repo.name
        self.loign = repo.login
        self.type = repo.type
    }
}
