//
//  RealmManager.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/1/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmManager {
    typealias completion = (RealmResult) -> ()
    
    enum RealmResult {
        case sucessful
        case failture(RealmError)
    }
    
    enum RealmError: Error {
        case errorConfig
        case error(String)
        case errorOutTransaction
    }
    
    static let shared = RealmManager()
    var realm: Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("Realm is no exist")
        }
    }
    
    private init() {}
}

extension RealmManager {
    
    func fetchObject<T: Object>(type: T.Type, completion: completion) -> [T] {
        guard let realm = realm else {
            completion(.failture(.error("Realm is not exist")))
            return []
        }
        var objects: [T] = []
        let realmObject = realm.objects(type)
        realmObject.forEach { objects.append($0) }
        completion(.sucessful)
        return objects
    }
    
    func writeObject(action: () -> (), completion: completion? = nil) {
        guard let realm = realm else {
            completion?(.failture(.errorConfig))
            return
        }
        do {
            try realm.write {
                if realm.isInWriteTransaction {
                    action()
                    completion?(.sucessful)
                } else {
                    completion?(.failture(.errorOutTransaction))
                }
            }
        } catch let err {
            completion?(.failture(.error(err.localizedDescription)))
        }
    }
    
    func addObject<T: Object>(with object: T , completion: completion? = nil) {
        writeObject(action: {
            realm?.add(object)
        }, completion: completion)
    }
    
    func deleteAllObject<T: Object>(with objects: [T], completion: completion? = nil) {
        writeObject(action: {
            realm?.delete(objects)
        }, completion: completion)
    }
    
    func deleteObject<T: Object>(with object: T, completion: completion? = nil) {
        writeObject(action: {
            realm?.delete(object)
        }, completion: completion)
    }
}
