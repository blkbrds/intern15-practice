//
//  Video.swift
//  DemoAPIYoutube
//
//  Created by PhuocNguyen on 10/28/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import RealmSwift
import UIKit

class Video: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var imageURL: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var channel: String = ""
    @objc dynamic var published = Date()
    @objc dynamic var regionCode: String = ""
    
    required convenience init(dict: [String: Any]) {
        self.init(value: dict)
        self.title = dict["title"] as? String ?? ""
        self.imageURL = dict["imageURL"] as? String ?? ""
        self.channel = dict["channelTitle"] as? String ?? ""
        self.id = dict["id"] as? String ?? ""
        self.regionCode = dict["region"] as? String ?? ""
        if let dateString = dict["publishedAt"] as? String, let date = dateString.convertToDate() {
            self.published = date
        }
    }
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
}