//
//  LoginViewModel.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation

final class LoginViewModel {
    
    // MARK: - enum
    enum LoginResult {
        case success
        case failure(Bool, String)
    }
    
    // MARK: - typealias
    typealias Completion = (LoginResult) -> Void
    
    // MARK: - Properties
    var email: String = ""
    var password: String = ""
    
    // MARK: - Actions
    func login(email: String, password: String, completion: Completion) {
        if email == "" || password == "" {
            //callback
            completion(.failure(true, "Mật khẩu hoặc email rỗng."))
        } else {
            //cập nhật dữ liệu
            self.email = ""
            self.password = ""
            
            //save data
            DataManager.shared().save(email: email, password: password)
            
            //callback
            completion(.success)
        }
    }
    
    func login(email: String, password: String, completion: (Bool) -> ()) {
        if email == "" || password == "" {
            completion(false)
        } else {
            completion(true)
        }
    }
}
