//
//  API.swift
//  BaitapAPI
//
//  Created by ADMIN on 8/11/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

struct DataAPIResult {
    var dataAPI: [Book]
}

enum APIResult<T> {
    case success(T)
    case failure(String)
}

