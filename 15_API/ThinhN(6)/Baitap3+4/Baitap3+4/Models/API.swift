//
//  API.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

struct DataAPI {
    var videos: [VideoAPI]
}

enum APIResult<T> {
    
    case success(T)
    case error(String)
}
