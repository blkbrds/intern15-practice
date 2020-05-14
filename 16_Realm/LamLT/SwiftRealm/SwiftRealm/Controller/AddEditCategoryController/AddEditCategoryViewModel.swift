//
//  AddEditCategoryViewModel.swift
//  SwiftRealm
//
//  Created by PCI0002 on 5/13/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

class AddEditCategoryViewModel {

    var category = Category()

    init() { }

    init(category: Category) {
        self.category = category
    }
}
