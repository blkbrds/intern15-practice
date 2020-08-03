//
//  HomeViewModel.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/3/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import RealmSwift

class HomeViewModel {
    var books: [Book] = []
    func fetchData(completion: (Bool) -> ()) {
        do {
            // realm
            let realm = try Realm()
            
            // results
            let results = realm.objects(Book.self)
            
            // convert to array
            books = Array(results)
            
            // call back
            completion(true)
            
        } catch {
            // call back
            completion(false)
        }
    }
}
