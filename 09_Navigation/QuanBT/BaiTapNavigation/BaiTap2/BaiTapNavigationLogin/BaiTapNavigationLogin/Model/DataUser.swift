//
//  DataUser.swift
//  BaiTapNavigationLogin
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class DataUser {
    var testuser = ""
    var testpass = ""
    var usernames: [String] = ["quan", "admin", "vu"]
    var passwords: [String] = ["quan123", "admin123", "vu123"]
    var result = 0
    
    static var share: DataUser = DataUser()
    
    func test() -> Int {
        for index in 0 ..< usernames.count {
            if usernames[index] == testuser {
                if passwords[index] == testpass {
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
