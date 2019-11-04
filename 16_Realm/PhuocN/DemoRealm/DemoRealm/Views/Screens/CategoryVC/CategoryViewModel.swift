//
//  CategoryViewModel.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class CategoryViewModel {
    var category: Category
    
    init(category: Category) {
        self.category = category
    }
    
    func getCount() -> Int {
        return category.posts.count
    }
    
    func getPost(in index: IndexPath) -> Post{
        return category.posts[index.row]
    }
}
