//
//  Owner.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import RealmSwift

class Owner {
    var login: String
    var id: Int
    var nodeId: String
    var htmlURL: String
    var siteAdmin: Bool
    var avatarUrl: String

    var type: String

    init(json: JSON) {
        self.login = json["login"] as! String
        self.id = json["id"] as! Int
        self.nodeId = json["node_id"] as! String
        self.htmlURL = json["html_url"] as! String
        self.avatarUrl = json["avatar_url"] as! String
        self.type = json["type"] as! String
        self.siteAdmin = json["site_admin"] as! Bool
    }
}
