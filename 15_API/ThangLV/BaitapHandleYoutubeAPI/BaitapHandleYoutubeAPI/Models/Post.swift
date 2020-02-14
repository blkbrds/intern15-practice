//
//  Post .swift
//  BaitapHandleYoutubeAPI
//
//  Created by PCI0008 on 2/12/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import Foundation
import UIKit

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        }
    }
}

final class Post {
    var kind: String
    var etag: String
    var publishedAt: String
    var channelId: String
    var title: String
    var description: String
    var thumbnailImage: UIImage?
    
    init(json: JSONObject) {
        kind = json["kind"] as? String ?? ""
        etag = json["etag"] as? String ?? ""
        publishedAt = json["publishedAt"] as? String ?? ""
        channelId = json["channelId"] as? String ?? ""
        title = json["title"] as? String ?? ""
        description = json["description"] as? String ?? ""
    }
}

