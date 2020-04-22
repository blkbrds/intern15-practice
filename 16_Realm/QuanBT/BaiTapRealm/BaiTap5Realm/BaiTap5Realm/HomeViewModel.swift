//
//  HomeViewModel.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeViewModel {
    // MARK: - Properties
    private var categories: [Category] {
        return RealmManager.shared.fetchObject(type: Category.self, completion: { result in
            switch result {
            case .failture(let error):
                print("error", error.localizedDescription)
            case .sucessful:
                print("Success")
            }
        })
    }
    
    // MARK: - Function
    func getCategories() -> [Category] {
        return categories
    }
    
    func getCount() -> Int {
        return categories.count
    }
    
    func getCategory(at indexPath: IndexPath) -> Category {
        return categories[indexPath.row]
    }
}
