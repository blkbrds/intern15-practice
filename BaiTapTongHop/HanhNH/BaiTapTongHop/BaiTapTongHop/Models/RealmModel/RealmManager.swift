//
//  RealmManager.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/20/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import RealmSwift

typealias RealmCompletion<T> = (Result<T, Error>) -> Void

final class RealmManager {
    static let shared: RealmManager = {
       let object = RealmManager()
        return object
    }()

    func saveUser(user: User, completion: RealmCompletion<Bool>) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(User.self, value: user, update: .all)
                completion(.success(true))
            }
        } catch {
            completion(.failure(Errors.realmError))
        }
    }

    func delete(user: User, completion: RealmCompletion<Bool>) {
        do {
            let realm = try Realm()
            let object = realm.objects(User.self).filter("id = %@", user.id)
            try realm.write {
                realm.delete(object)
                completion(.success(true))
            }
        } catch {
            completion(.failure(Errors.realmError))
        }
    }

    func getAllOnRealm(completion: RealmCompletion<Results<User>>) {
        do {
            let realm = try Realm()
            let object = realm.objects(User.self)
            completion(.success(object))
        } catch {
            completion(.failure(Errors.realmError))
        }
    }

    func isFavoriteUser(id: String, completion: RealmCompletion<Bool>) {
        do {
            let realm = try Realm()
            let object = realm.objects(User.self).filter("id = %@", id)
            if object.first != nil {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        } catch {
            completion(.failure(Errors.realmError))
        }
    }

    func deletaPlace(id: String, completion: RealmCompletion<Bool>) {
        do {
            let realm = try Realm()
            try realm.write {
                if let object = realm.object(ofType: User.self, forPrimaryKey: id) {
                    realm.delete(object)
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(Errors.realmError))
        }
    }
    
    func deleteAllUser(complection: RealmCompletion<Bool>) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            complection(.failure(Errors.realmError))
        }
    }
}
