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
    
    private var users: [User]

    init(users: [User] = [User()]) {
        self.users = users
    }
    
    func numberOfRows(in section: Int) -> Int {
        return users.count
    }
    
    func loadDataForForFavorite(completion: APICompletion<[User]>) {
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
    
    func viewModelForItems(at indexPath: IndexPath) -> HomeCellTableViewModel {
        return HomeCellTableViewModel(user: users[indexPath.row])
    }
}
