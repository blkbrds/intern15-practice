//
//  DataAPI.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

class DataAPI {
    var titleVideo: String
    var channelTitle: String
    var publishedAt: String
    var url: String
    
    init(titleVideo: String = "", publishedAt: String = "", channelTitle: String = "", url: String = "") {
        self.titleVideo = titleVideo
        self.publishedAt = publishedAt
        self.channelTitle = channelTitle
        self.url = url
    }
}
