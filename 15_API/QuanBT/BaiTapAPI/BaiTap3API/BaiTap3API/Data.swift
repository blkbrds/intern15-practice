//
//  Data.swift
//  BaiTap3API
//
//  Created by Sếp Quân on 4/13/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import UIKit

typealias JSON = [String: Any]

extension Data {
    func toJSON() -> JSON {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JSON {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
}

final class DataAPI {
    // MARK: - Properties
    var titleVideo: String
    var channelTitle: String
    var publishedAt: String
    var url: String
    var thumbnail: UIImage?
    
    // MARK: - Init
    init(titleVideo: String = "", channelTitle: String = "", publishedAt: String = "", url: String = "") {
        self.titleVideo = titleVideo
        self.channelTitle = channelTitle
        self.publishedAt = publishedAt
        self.url = url
    }
}
