//
//  DataAPI.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

class VideoAPI {
    var titleVideo: String = ""
    var channelTitle: String = ""
    var publishedAt: String = ""
    var url: String = ""
    
    init(snippet: JSON) {
        guard let title = snippet["title"] as? String, let publishedAt = snippet["publishedAt"] as? String, let channelTitle = snippet["channelTitle"] as? String, let thumbnail = snippet["thumbnails"] as? JSON, let defaultAPI = thumbnail["default"] as? JSON, let urlAPI = defaultAPI["url"] as? String else { return }
        self.titleVideo = title
        self.channelTitle = channelTitle
        self.publishedAt = publishedAt
        self.url = urlAPI
    }
}
