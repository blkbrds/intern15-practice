//
//  Item.swift
//  BaiTapRealm
//
//  Created by PCI0012 on 6/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation
import RealmSwift

final class Item: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var subTitle: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
