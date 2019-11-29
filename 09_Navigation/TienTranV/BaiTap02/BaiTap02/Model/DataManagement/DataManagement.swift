//
//  DataManagement.swift
//  BaiTap02
//
//  Created by PCI0002 on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

enum Key: String {
    case userName = "userName"
    case password = "password"
}

class DataManagement {
    // MARK: - Singleton
    public static var share: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    // MARK: - public function
    init() { }

    func getUsers(fileName: String, type: String) -> [User] {
        guard let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type)) else { return [] }
        var users: [User] = []
        for item in array {
            guard let dict = item as? NSDictionary else { continue }
            guard let userName = dict.object(forKey: Key.userName.rawValue) as? String else { continue }
            guard let password = dict.object(forKey: Key.password.rawValue) as? String else { continue }
            let user = User(userName: userName, password: password)
            users.append(user)
        }
        return users
    }

    // MARK: - private function
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
