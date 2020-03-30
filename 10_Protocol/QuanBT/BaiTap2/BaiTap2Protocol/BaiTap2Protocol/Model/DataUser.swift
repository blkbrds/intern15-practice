//
//  DataUser.swift
//  BaiTap2Protocol
//
//  Created by Sếp Quân on 3/30/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class DataUser {
     // MARK: - Properties
    var usenames: [String] = ["Quan", "Thang", "Tan", "Vu", "Hien", "Anh", "Thien", "Tay", "Quoc", "Thinh", "Quan2", "Thang2", "Tan2", "Vu2", "Hien2", "Anh2", "Thien2", "Tay2", "Quoc2", "Thinh2", "Quan3", "Thang3", "Tan3", "Vu3", "Hien3", "Anh3", "Thien3", "Tay3", "Quoc3", "Thinh3"]
     let images: [String] = Array(repeating: "avatar", count: 30)
    
    static let shared: DataUser = DataUser()
    
}
