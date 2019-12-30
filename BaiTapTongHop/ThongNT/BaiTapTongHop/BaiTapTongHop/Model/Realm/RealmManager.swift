//
//  RealmManager.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmManager {

    typealias RealmCompletion = (RealmResult) -> Void

    static let shared = RealmManager()

    var realm: Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Can not cast Realm")
        }
    }

    private init() { }

    enum RealmResult {
        case success
        case failure(error: String)
    }
}

// MARK: - Functions
extension RealmManager {

    // return true when it also stored in Realm
    func checkPK(id: String) -> Bool {
        let favorites = getObjectsFromRealm()
        for place in favorites {
            if place.idPlace == id {
                return false
            }
        }
        return true
    }
    
    func addPlace(place: GooglePlace, completion: @escaping RealmCompletion) {
        do {
            try realm.write {
                print("----RealmURL: ", Realm.Configuration.defaultConfiguration.fileURL)
                if checkPK(id: place.idPlace) {
                    let favor = Favorites(place: place)
                    realm.add(favor)
                    completion(.success)
                } else {
                    completion(.failure(error: "This place was added"))
                }
            }
        } catch {
            completion(.failure(error: "Cannot add place to Realm"))
        }
    }

    func deletaPlace(idPlace: String, completion: @escaping RealmCompletion) {
        do {
            try realm.write {
                if let placeNeedToRemove = realm.object(ofType: Favorites.self, forPrimaryKey: idPlace) {
                    realm.delete(placeNeedToRemove)
                    completion(.success)
                }
            }
        } catch {
            completion(.failure(error: error.localizedDescription))
        }
    }
    
    func deleteAll(completion: @escaping RealmCompletion) {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            completion(.failure(error: "Cannot remove all favorited places"))
        }
    }

    func getObjectsFromRealm() -> [Favorites] {
        var objects: [Favorites] = []
        let realmObjects = realm.objects(Favorites.self)
        realmObjects.forEach { objects.append($0) }
        return objects
    }
}
