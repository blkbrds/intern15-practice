//
//  Owner.swift
//  API
//
//  Created by PCI0012 on 6/17/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation
import UIKit

class Ownner {
    var login: String = ""
    var avatarURl: String = ""
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        if let login = json["login"] as? String {
            self.login = login
        }
        
        if let avatarURL = json["avatar_url"] as? String {
            self.avatarURl = avatarURL
        }
    }
}
