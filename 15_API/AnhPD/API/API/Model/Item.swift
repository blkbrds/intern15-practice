//
//  Item.swift
//  API
//
//  Created by PCI0012 on 6/17/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation
import UIKit

class Item {
    var id: Int = 0
    var nodeID: String = ""
    var name: String = ""
    var login: String = ""
    var avatarURL: String = ""
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        if let id = json["id"] as? Int {
            self.id = id
        }
        
        if let nodeID = json["node_id"] as? String {
            self.nodeID = nodeID
        }
        
        if let name = json["name"] as? String {
            self.name = name
        }
        
        if let ownerJS = json["owner"] as? JSON {
            if let login = ownerJS["login"] as? String, let avatarURL = ownerJS["avatar_url"] as? String {
                self.login = login
                self.avatarURL = avatarURL
            }
        }
    }
}
