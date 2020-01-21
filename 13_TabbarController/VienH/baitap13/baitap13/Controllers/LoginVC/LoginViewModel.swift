//
//  LoginViewModel.swift
//  baitap13
//
//  Created by user on 1/20/20.
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
            self.email = ""
            self.password = ""
            completion(.success)
        }
    }

    func login(email: String, password: String, completion: (Bool) -> ()) {
        if email == "Vien" || password == "Vien" {
            completion(false)
        } else {
            completion(true)
        }
    }
}
