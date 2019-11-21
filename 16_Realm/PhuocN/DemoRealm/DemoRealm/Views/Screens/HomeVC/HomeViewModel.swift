//
//  HomeViewModel.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/1/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

final class HomeViewModel {
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
