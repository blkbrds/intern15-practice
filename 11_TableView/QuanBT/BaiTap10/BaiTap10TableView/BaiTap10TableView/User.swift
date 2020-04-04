//
//  User.swift
//  BaiTap10TableView
//
//  Created by Sếp Quân on 4/4/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class User {
    // MARK: - Properties
    var nameUser: String
    var imageUser: String
    var subTitle: String
    
    // MARK: - Init
    init(name: String, image: String, title: String) {
        self.nameUser = name
        self.imageUser = image
        self.subTitle = title
    }
    
    // MARK: - Function
    static func getUser() -> [[User]] {
        var users: [[User]] = []
        guard let path = Bundle.main.url(forResource: "Contact", withExtension: "plist") else {
            return [[User]()]
        }
        guard let data = NSArray(contentsOf: path) as? [[[String]]] else {
            return [[User]()]
        }
        
        for index1 in 0 ..< data.count {
            var userNames = [User]()
            for index2 in 0 ..< data[index1].count {
                let user = User(name: data[index1][index2][0], image: "avatar", title: data[index1][index2][1])
                userNames.append(user)
            }
            users.append(userNames)
        }
        return users
    }
}
