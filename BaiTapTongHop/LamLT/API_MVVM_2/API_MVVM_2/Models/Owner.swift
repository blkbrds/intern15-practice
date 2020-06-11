//
//  Owner.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/1/20.
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
    
    init(login: String, type: String, id: Int, nodeId: String, htmlURL: String, siteAdmin: Bool, avatarUrl: String) {
        self.login = login
        self.type = type
        self.id = id
        self.nodeId = nodeId
        self.htmlURL = htmlURL
        self.siteAdmin = siteAdmin
        self.avatarUrl = avatarUrl
    }
}
