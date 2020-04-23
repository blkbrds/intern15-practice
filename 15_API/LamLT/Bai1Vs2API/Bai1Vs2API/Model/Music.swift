//
//  Music.swift
//  Bai1Vs2API
//
//  Created by PCI0002 on 4/23/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit

final class Music {
    var title: String
    var imimage: String
    var thumbnailImage: UIImage?

    init(json: JSON) {
        let imname = json["im:name"] as! JSON
        self.title = imname["label"] as! String

        let imimage1 = json["im:image"] as! [JSON]
        let item2 = imimage1[0]
        self.imimage = item2["label"] as! String
    }
}

