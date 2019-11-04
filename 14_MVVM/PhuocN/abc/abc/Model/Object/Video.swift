//
//  Video.swift
//  DemoAPIYoutube
//
//  Created by PhuocNguyen on 10/28/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import UIKit

final class Video {
    var imageURL: String
    var title: String
    var channel: String
    var published: String
    
    init(dict: [String: Any]) {
        self.title = dict["title"] as? String ?? ""
        self.imageURL = dict["imageURL"] as? String ?? ""
        self.channel = dict["channelTitle"] as? String ?? ""
        self.published = dict["publishedAt"] as? String ?? ""
    }
}
