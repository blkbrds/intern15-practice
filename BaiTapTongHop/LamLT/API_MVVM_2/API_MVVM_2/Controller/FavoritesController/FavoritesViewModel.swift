//
//  FavoritesViewModel.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/8/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//
import Foundation
import RealmSwift

//MARK: Protocol
protocol FavoritesViewModelDelegate: class {
    func viewModel(_ viewModel: FavoritesViewModel, needperfomAction action: FavoritesViewModel.Action)
}

class FavoritesViewModel {
    
    //MARK: Properties
    var repos: [RepoRealm] = []

    enum Action {
        case reloadData
    }

    weak var delegate: FavoritesViewModelDelegate?

    private var notificationToke: NotificationToken?

    //MARK: Realm
    func setupObserve() {
        let realm = try! Realm()
        notificationToke = realm.objects(RepoRealm.self).observe({ (change) in
            self.delegate?.viewModel(self, needperfomAction: .reloadData)
        })
    }

    func fetchData(completion: (Bool, String) -> ()) {
        do {
            // realm
            let realm = try Realm()

            let results = realm.objects(RepoRealm.self)

            repos = Array(results)

            completion(true, "Success")
        } catch {
            completion(false, "Failed")
        }
    }

    func insertRepo(name: String, login: String, type: String, image: String) {
        let realm = try! Realm()
        let repo = RepoRealm()
        repo.name = name
        repo.login = login
        repo.type = type
        repo.imageURL = image

        try! realm.write {
            realm.add(repo)
        }
    }

    func deleteAll(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()

            let results = realm.objects(RepoRealm.self)

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
            let getItem = repos[indexPath.row]
            let id = getItem.id
            let repo = realm.objects(RepoRealm.self).filter("id = \(id)")
            if repo.count == 0 {
                completion(false, "Delete Object Failed")
            } else {
                try realm.write {
                    realm.delete(repo)
                    completion(true, "Success To Delete Object")
                }
            }
        } catch {
            completion(false, "Delete Object Failed")
        }
    }

    //MARK: TableView
    func heightForRowAt() -> CGFloat {
        return 120
    }

    func favoritesCell(at indexPath: IndexPath) -> FavoritesCellViewModel {
        let item = repos[indexPath.row]
        let viewmodel = FavoritesCellViewModel(repo: item)
        return viewmodel
    }

    func getRepo(at indexPath: IndexPath) -> RepoRealm {
        return repos[indexPath.row]
    }

    func numberOfRowsInSection() -> Int {
        return repos.count
    }
}
