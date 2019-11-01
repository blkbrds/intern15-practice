//
//  RealmManager.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/1/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    var realm: Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("Realm is no exist")
        }
    }
    
    private init() {}
}
