//
//  FavoriteViewMoel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class FavoriteViewMoel {
    
    typealias complecion = (Bool, String) -> Void
    private var users: [User]

    init(users: [User] = [User()]) {
        self.users = users
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
    // TODO: chức năng xoá tất cả favorited chưa cần review
//    func removeAll(completion: Completion) {
//        User.deleteAll { (result) in
//            switch result {
//            case .failure(let error):
//                completion(.failure(error))
//            case .success:
//                completion(.success(nil))
//            }
//        }
//    }
    
    func viewModelForItems(at indexPath: IndexPath) -> HomeCellTableViewModel {
        return HomeCellTableViewModel(user: users[indexPath.row])
    }
    
    func getNumberOfFavoritedPlace() -> Int {
        return users.count
    }
}
