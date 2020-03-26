//
//  DataUser.swift
//  BaiTapNavigationLogin
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

class DataUser {
    var testuser = ""
    var testpass = ""
    var username: [String] = ["quan", "admin", "vu"]
    var password: [String] = ["quan123", "admin123", "vu123"]
    var result = 0
    
   static var share: DataUser = DataUser()
    
     func test() -> Int {
        for index in 0 ..< username.count {
            if username[index] == testuser {
                if password[index] == testpass {
                    result = index
                    return 1
                } else {
                    result = 0
                }
            } else {
                result = 0
            }
        }
        return 0
    }
}
