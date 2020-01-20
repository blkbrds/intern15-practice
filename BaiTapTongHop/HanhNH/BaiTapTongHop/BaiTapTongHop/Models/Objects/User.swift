//
//  User.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class User: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var avatarName: String?
    var coverImageNames = List<String>()
    @objc dynamic var descriptionName: String = ""
    var comments = List<Comment>()
    @objc var numberOfWatchers: Int = 0
    @objc var numberOfForks: Int = 0

    override static func primaryKey() -> String? {
        return "id"
    }

    static func saveUser(user: User, completion: APICompletion<Bool>) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(User.self, value: user, update: .all)
                completion(.success(true))
            }
        } catch {
            completion(.failure(APIError.errorRealm))
        }
    }

    static func delete(user: User, completion: APICompletion<Bool>) {
        do {
            let realm = try Realm()
            let object = realm.objects(User.self).filter("id = %@", user.id)
            try realm.write {
                realm.delete(object)
                completion(.success(true))
            }
        } catch {
            completion(.failure(APIError.errorRealm))
        }
    }

    static func getAllOnRealm(completion: APICompletion<Results<User>>) {
        do {
            let realm = try Realm()
            let object = realm.objects(User.self)
            completion(.success(object))
        } catch {
            completion(.failure(APIError.errorRealm))
        }
    }

    static func checkLikedUser(user: User, completion: APICompletion<Bool>) {
        do {
            let realm = try Realm()
            let object = realm.objects(User.self).filter("id = %@", user.id)
            if object.first != nil {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        } catch {
            completion(.failure(APIError.errorRealm))
        }
    }

    static func deletaPlace(id: String, completion: APICompletion<Bool>) {
        do {
            let realm = try Realm()
            try realm.write {
                if let object = realm.object(ofType: User.self, forPrimaryKey: id) {
                    realm.delete(object)
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(APIError.errorRealm))
        }
    }
    
    static func deleteAll(complection: APICompletion<Bool>) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            complection(.failure(APIError.errorRealm))
        }
    }
    
    static func setupObserve(compection: APICompletion<Bool>) {
        do {
            let realm = try Realm()
            let observe = realm.objects(User.self).observe { (change) in
                
            }
            try realm.write {
                
            }
        } catch {
            
        }
    }
}
