//
//  API.Manager.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class Router {
    static let domain: String = "https://api.github.com/"
    struct Repository {
        static let path: String = domain + "search/repositories?" + "q=topic:swift&page=1&per_page=10"
    }
}

final class APIManager {

    struct Repository { }
}
