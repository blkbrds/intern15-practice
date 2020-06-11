//
//  HomeCellModel.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit

final class HomeCellModel {
    var name: String
    var login: String
    var type: String
    var thumbnailImage: UIImage?
    
    init(repo: Repositories) {
        self.name = repo.name
        self.login = repo.owner.login
        self.type = repo.owner.type
        self.thumbnailImage = repo.thumbnailImage
    }
}
