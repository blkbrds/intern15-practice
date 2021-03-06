//
//  User.swift
//  BaiTap9_9'TableView
//
//  Created by Sếp Quân on 4/3/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class User {
    // MARK: - Properties
    var nameUser: String
    var imageUser: String
    var subTitle: String
    
    // MARK: - Init
    init(name: String = "", image: String = "", title: String = "") {
        self.nameUser = name
        self.imageUser = image
        self.subTitle = title
    }
}
