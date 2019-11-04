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
        case failture(Error)
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
        guard let realm = realm else { return [] }
            //completion(.failture())
        var objects: [T] = []
        let realmObject = realm.objects(type)
        realmObject.forEach { objects.append($0)}
        completion(.sucessful)
        return objects
    }
    
    func writeObject(action: () -> (), completion: completion?) {
        realm?.beginWrite()
        action()
        do {
            if realm!.isInWriteTransaction {
                try realm?.commitWrite()
                completion?(.sucessful)
            } else {
                print("fail")
            }
        } catch {
            realm?.cancelWrite()
            completion?(.failture(error))
        }
    }
    
    func addObject<T: Object>(with object: T ,update: Bool = false, completion: completion?) {
        writeObject(action: {
            realm?.add(object)
        }, completion: completion)
    }
    
    func deleteAllObject<T: Object>(with objects: [T], completion: completion?) {
        writeObject(action: {
            realm?.delete(objects)
        }, completion: completion)
    }
}
