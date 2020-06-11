//
//  GitFavoritesViewModel.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/9/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import RealmSwift

//MARK: Protocol
protocol GitFavoritesViewModelDelegate: class {
    func viewModel(_ viewModel: GitFavoritesViewModel, needperfomAction action: GitFavoritesViewModel.Action)
}


class GitFavoritesViewModel {

    //MARK: Properties
    var gits: [GitRealm] = []

    enum Action {
        case reloadData
    }

    weak var delegate: GitFavoritesViewModelDelegate?

    private var notificationToke: NotificationToken?

    //MARK: Realm
    func setupObserve() {
        let realm = try! Realm()
        notificationToke = realm.objects(GitRealm.self).observe({ (change) in
            self.delegate?.viewModel(self, needperfomAction: .reloadData)
        })
    }

    func fetchData(completion: (Bool, String) -> ()) {
        do {
            // realm
            let realm = try Realm()
            let results = realm.objects(GitRealm.self)
            gits = Array(results)
            completion(true, "Success")
        } catch {
            completion(false, "Failed")
        }
    }

    func deleteAll(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(GitRealm.self)
            try realm.write {
                realm.delete(results)
            }
            completion(true)
        } catch {
            completion(false)
        }
    }

    func deleteOneObject(indexPath: IndexPath, completion: (Bool, String) -> Void) {
        do {
            let realm = try Realm()
            let getItem = gits[indexPath.row]
            let id = getItem.id
            let git = realm.objects(GitRealm.self).filter("id = \(id)")
            if git.count == 0 {
                completion(false, "Delete Object Failed")
            } else {
                try realm.write {
                    realm.delete(git)
                    completion(true, "Success To Delete Object")
                }
            }
        } catch {
            completion(false, "Delete Object Failed")
        }
    }

    //MARK: Data TableView
    func numberOfRowsInSection() -> Int {
        return gits.count
    }

    func heightForRowAt() -> CGFloat {
        return 100
    }

    func favoritesCell(at indexPath: IndexPath) -> GitFavoritesCellModel {
        let item = gits[indexPath.row]
        let viewmodel = GitFavoritesCellModel(git: item)
        return viewmodel
    }

    func getGit(at indexPath: IndexPath) -> GitRealm {
        return gits[indexPath.row]
    }
}
