//
//  OwnerHeaderModel.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit

class OwnerHeaderModel {
    
    var login: String
    var imageHeader: UIImage?
    
    init(login: String, imageHeader: UIImage?) {
        self.login = login
        self.imageHeader = imageHeader
    }
}
