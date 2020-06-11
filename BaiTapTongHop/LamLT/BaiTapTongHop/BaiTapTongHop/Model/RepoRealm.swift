//
//  RepoRealm.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class RepoRealm: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var login = ""
    @objc dynamic var type = ""
    @objc dynamic var imageURL = ""
    
    @objc dynamic var isFavoties = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
