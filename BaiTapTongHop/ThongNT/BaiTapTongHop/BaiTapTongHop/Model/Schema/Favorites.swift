//
//  FavoritesRealm.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import RealmSwift

final class Favorites: Object {

    @objc dynamic var idPlace: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var rating: Double = 0
    @objc dynamic var distance: Int = 0
    @objc dynamic var iconString: String = ""
    
    override class func primaryKey() -> String? {
        return "idPlace"
    }

    convenience init(place: GooglePlace) {
        var schema: [String: Any] = [:]
        schema["idPlace"] = place.idPlace
        schema["name"] = place.name
        schema["address"] = place.address
        schema["rating"] = place.rating
        schema["distance"] = place.distance
        schema["iconString"] = place.iconString
        self.init(value: schema)
    }
}
