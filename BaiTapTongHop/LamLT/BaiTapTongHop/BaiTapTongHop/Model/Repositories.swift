//
//  Repositories.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Repositories {
    var name: String
    var descriptionRepo: String
    var owner: Owner
    var thumbnailImage: UIImage?

    init(json: JSON) {
        self.name = json["name"] as! String

        if let description = json["description"] as? String {
            self.descriptionRepo = description
        } else {
            self.descriptionRepo = ""
        }

        let owner = json["owner"] as! JSON
        self.owner = Owner(json: owner)
    }
}
