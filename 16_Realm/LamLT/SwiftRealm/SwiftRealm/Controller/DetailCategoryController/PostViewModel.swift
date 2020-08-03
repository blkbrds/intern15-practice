//
//  PostViewModel.swift
//  SwiftRealm
//
//  Created by PCI0002 on 5/13/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import RealmSwift

class PostViewModel {
    var posts: [Post] = []

    // MARK: - Puclic Functions
    func fetchData(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Post.self)
            posts = Array(results)
            print(posts)
            completion(true)
        } catch {
            completion(false)
        }
    }

    func deleteAll(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Post.self)
            try realm.write {
                realm.delete(results)
            }
            completion(true)
        } catch {
            completion(false)
        }
    }
}
