//
//  HomeCellViewModel.swift
//  BaiTapRealm
//
//  Created by PCI0012 on 6/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

final class HomeCellViewModel {
    var title: String
    var subTitle: String
    var id: Int
    
    init(item: Item) {
        self.title = item.title
        self.subTitle = item.subTitle
        self.id = item.id
    }
}
