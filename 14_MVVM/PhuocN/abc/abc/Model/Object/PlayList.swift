//
//  PlayList.swift
//  abc
//
//  Created by PhuocNguyen on 11/11/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import RealmSwift

final class PlayList: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var imageURL: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var channel: String = ""
    @objc dynamic var published: String = ""
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var regionCode: String = ""
    
    required convenience init(video: Video) {
        self.init(value: video)
        self.title = video.title
        self.imageURL = video.imageURL
        self.channel = video.channel
        self.published = video.published
        self.id = video.id
        self.regionCode = video.regionCode
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
