//
//  User.swift
//  BaiTap02
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import Foundation

struct User: Codable {
  let username: String
  let password: String

  init() {
    self.password = ""
    self.username = ""
  }

  init(username: String, password: String) {
    self.password = password
    self.username = username
  }

  init(userDict: Dictionary<String, String>) {
    self.password = userDict["password"] ?? ""
    self.username = userDict["username"] ?? ""
  }
}
