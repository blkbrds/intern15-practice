//
//  API.Manager.swift
//  DemoConnectNetworking
//
//  Created by PCI0002 on 4/22/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

struct APIManager {
    //MARK: Config
    struct Path {
        static let base_domain = "https://rss.itunes.apple.com"
        static let base_path = "/api/v1/us"

        static let music_path = "/itunes-music"
        static let music_hot = "/hot-tracks"
    }

    //MARK: - Domain
    struct Music { }

    struct Downloader { }
}
