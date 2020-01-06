//
//  UserData.swift
//  BaiTap02
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import Foundation

enum SaveError: Error {
  case canNotSave(error: String)
  case pathIsEmpty
}

final class UserData {
  static var users: [User] = []
  
  static func readFilePlist() {
    if let url = Bundle.main.url(forResource: "user", withExtension: "plist") {
      guard let array = NSArray.init(contentsOf: url) else { return }
      users = array.map({
        guard let userDict = $0 as? Dictionary<String, String> else { return User() }
        return User(userDict: userDict)
      })
    }
  }
  
  static func saveData() throws {
    if let url = Bundle.main.url(forResource: "user", withExtension: "plist") {
      let encoder = PropertyListEncoder()
      encoder.outputFormat = .xml
      do {
        let data:Data = try encoder.encode(users)
        print(data)
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("user.plist")
        try data.write(to: url)
        print("Saved!")
        print(path)
      }catch {
        throw SaveError.canNotSave(error: error.localizedDescription)
      }
    }
    throw SaveError.pathIsEmpty
  }
}
