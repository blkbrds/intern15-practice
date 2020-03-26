//
//  Thumbnai.swift
//  BaitapHandleYoutubeAPI
//
//  Created by PCI0008 on 2/13/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class Thumbnail {
    var url: String
    var width: Int
    var height: Int
    
    init(json: JSONObject) {
        url = json["url"] as? String ?? ""
        width = json["width"] as? Int ?? 0
        height = json["height"] as? Int ?? 0
    }
}

