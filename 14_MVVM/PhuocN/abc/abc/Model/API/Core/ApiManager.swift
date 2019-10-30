//
//  ApiManager.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 8/26/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
import UIKit

struct ApiManager {
    
    struct Path {
        static let baseURL = "https://www.googleapis.com/youtube/v3/"
    }
    
    struct Audio {}
    
    struct Downloader {}
    
    struct Video {}
}

extension ApiManager.Audio {
    
    static var xxx: String { return ApiManager.Path.baseURL + "/xxx" }
}
