//
//  RealmManager.swift
//  abc
//
//  Created by PhuocNguyen on 11/5/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
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
    
    var realm: Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Can not cast Realm")
        }
    }
    
    private init() {}
}

extension RealmManager {
    func fetchObject<T: Object>(type: T.Type, completion: completion?) -> [T] {
        var objects: [T] = []
        let realmObject = realm.objects(type)
        realmObject.forEach { objects.append($0) }
        completion?(.sucessful)
        return objects
    }
    
    func writeObject(action: () -> (), completion: completion? = nil) {
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
            realm.add(object)
        }, completion: completion)
    }
    
    func addObjects<T: Object>(with objects: [T] , completion: completion? = nil) {
        writeObject(action: {
            realm.add(objects)
        }, completion: completion)
    }
    
    
    func deleteAllObject<T: Object>(with objects: [T], completion: completion? = nil) {
        writeObject(action: {
            realm.delete(objects)
        }, completion: completion)
    }
    
    func deleteObject<T: Object>(with object: T, completion: completion? = nil) {
        writeObject(action: {
            realm.delete(object)
        }, completion: completion)
    }
    
    struct VideoRealm {}
}
