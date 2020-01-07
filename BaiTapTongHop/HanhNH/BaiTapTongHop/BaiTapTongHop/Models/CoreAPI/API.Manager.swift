//
//  API.Manager.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
class APIManager {
    struct Path {
        //https://api.github.com/search/repositories?q=topic:swift&page=1&per_page=10
        static let firstDommin: String = "https://api.github.com/"
        static let basePath: String = "search/repositories"
        static let path: String = "?q=topic:swift&"
        static let hotPath: String = "&per_page=10"
    }
    struct Repo { }

    struct Downloader { }
}
