//
//  Data.swift
//  BaiTap05
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import Foundation

class DataUser {

  static let shared: DataUser = DataUser()

  private init() { }

  open func getUsers() -> [User] {
    guard let url = Bundle.main.url(forResource: "Names", withExtension: "plist"),
      let names = NSArray(contentsOf: url) as? [String] else {
        return [User]()
    }
    return names.map({ User(name: $0) })
  }
}
