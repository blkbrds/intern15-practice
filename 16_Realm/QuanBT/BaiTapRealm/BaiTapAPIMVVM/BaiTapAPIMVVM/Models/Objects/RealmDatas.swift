//
//  RealmDatas.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmDatas: Object {
    // MARK: - Properties
    @objc dynamic var id = 1
//    var dataPages = List<RealmDataAPI>()
    
    // MARK: - PrimaryKey
    override class func primaryKey() -> String? {
        return "id"
    }
}
