//
//  LoginViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/25/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class LoginViewModel {
    var username: String = "ABC"
    var password: String = "123"
    
//    init(username: String, password: String) {
//        self.username = username
//        self.password = password
//    }
    
    func login(username: String, password: String, completion: (Bool) -> ()) {
        if username == self.username && password == self.password {
            completion(true)
        } else {
            completion((false))
        }
    }
}
