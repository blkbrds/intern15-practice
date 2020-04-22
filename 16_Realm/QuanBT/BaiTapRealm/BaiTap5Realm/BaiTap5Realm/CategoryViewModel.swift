//
//  CategoryViewModel.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class CategoryViewModel {
    // MARK: - Properties
    var category: Category
    
    // MARK: - Init
    init(category: Category) {
        self.category = category
    }
    
    // MARK: - Function
    func getCount() -> Int {
        return category.posts.count
    }
    
    func getPost(in index: IndexPath) -> Post{
        return category.posts[index.row]
    }
}
