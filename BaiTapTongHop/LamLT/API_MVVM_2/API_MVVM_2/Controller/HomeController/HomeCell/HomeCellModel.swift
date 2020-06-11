//
//  HomeCellModel.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 5/28/20.
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
