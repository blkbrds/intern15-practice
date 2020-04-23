//
//  HomeCellModel.swift
//  BaiTap10TableView
//
//  Created by Sếp Quân on 4/7/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeCellModel {
    // MARK: - Properties
    var user: User = User()
    
    init(user: User = User()) {
        self.user = user
    }
}
