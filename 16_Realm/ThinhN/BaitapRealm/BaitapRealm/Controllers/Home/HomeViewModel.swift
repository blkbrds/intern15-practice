//
//  HomeViewModel.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/3/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import RealmSwift

protocol HomeViewModelDelegate: class {
    func viewModel(_ viewModel: HomeViewModel, needperfomAction action: HomeViewModel.Action)
}

class HomeViewModel {
    var books: [Book] = []
    
    enum Action {
        case reloadData
    }

    weak var delegate: HomeViewModelDelegate?
    var notificationToken: NotificationToken?
    func setupObserve() {
        let realm = try! Realm()
        notificationToken = realm.objects(Book.self).observe({ (change) in
            self.delegate?.viewModel(self, needperfomAction: .reloadData)
        })
        
    }
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
    func deleteAll(completion: (Bool) -> ()) {
        do {
            // realm
            let realm = try Realm()
            
            // results
            let results = realm.objects(Book.self)
            
            // delete all items
            try realm.write {
                realm.delete(results)
            }
            
            // call back
            completion(true)
            
        } catch {
            // call back
            completion(false)
        }
    }
}
