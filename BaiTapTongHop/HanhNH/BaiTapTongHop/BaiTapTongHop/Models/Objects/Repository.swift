//
//  Repository.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

@objcMembers final class Repository: Object {

    dynamic var avatarUrl: String = ""
    dynamic var nameApp: String = ""
    dynamic var createdAt: String = ""
    dynamic var watchersCount: Int = 0
    dynamic var avatarImage: Data?
    dynamic var forksCount: Int = 0
    dynamic var descriptionName: String = ""

    init(json: JSON) {
        self.createdAt = json["created_at"] as! String
        self.watchersCount = json["watchers_count"] as! Int
        self.descriptionName = json["description"] as! String
        self.forksCount = json["forks_count"] as! Int
        let owner = json["owner"] as! JSON
        self.nameApp = owner["login"] as! String
        self.avatarUrl = owner["avatar_url"] as! String

    }

    required init() { }

    static func saveRepository(repo: Repository, completion: APICompletion<Bool>) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(repo)
                completion(.success(true))
            }
        } catch(let error) {
            print(error.localizedDescription)
            completion(.failure(Errors.realmError))
        }
    }
}

