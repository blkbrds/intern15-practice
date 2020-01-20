//
//  FavoriteViewMoel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol FavoriteViewModelDelegate: class {
    func viewModel(_viewModel: FavoriteViewMoel, needperfomAction action: FavoriteViewMoel.Action)
}

final class FavoriteViewMoel {
    
    typealias complecion = (Bool, String) -> Void
    private var users: [User]
    private var notificationToken: NotificationToken?
    var delegate: FavoriteViewModelDelegate?

    init(users: [User] = [User()]) {
        self.users = users
    }
    
    enum Action {
        case reloadData
    }
    
    func numberOfRows(in section: Int) -> Int {
        return users.count
    }
    
    func loadDataForFavorite(completion: APICompletion<[User]>) {
        User.getAllOnRealm() { (result) in
            switch result {
            case .success(let users):
                let usersData = Array(users)
                self.users = usersData
                completion(.success(usersData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func partialRemoval(at indexPath: IndexPath, completion: Completion) {
        User.deletaPlace(id: users[indexPath.row].id) { (result) in
            switch result {
            case .success:
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func setupObserve() {
        let realm = try! Realm()
        notificationToken = realm.objects(User.self).observe { action in
            self.delegate?.viewModel(_viewModel: self, needperfomAction: .reloadData)
        }
    }
    
    func removeAll(completion: Completion) {
        User.deleteAll { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success:
                completion(.success(nil))
            }
        }
    }
    
    func viewModelForItems(at indexPath: IndexPath) -> HomeCellTableViewModel {
        return HomeCellTableViewModel(user: users[indexPath.row])
    }
    
    func getNumberOfFavoritedPlace() -> Int {
        return users.count
    }
}