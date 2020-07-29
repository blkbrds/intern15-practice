//
//  DataAPI.swift
//  Baitap3API
//
//  Created by ADMIN on 7/28/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

final class VideoAPI {
    var titleVideo: String
    var publishedAt: String
    var channelTitle: String
    var url: String
    
    init(titleVideo: String = "", publishedAt: String = "", channelTitle: String = "", url: String = "") {
        self.titleVideo = titleVideo
        self.publishedAt = publishedAt
        self.channelTitle = channelTitle
        self.url = url
    }
}
