//
//  DataAPI.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import UIKit

final class DataAPI {
    // MARK: - Properties
    var idVideo: String
    var titleVideo: String
    var channelTitle: String
    var publishedAt: String
    var url: String?
    var thumbnail: UIImage?
    var favorite: Bool
    
    // MARK: - Init
    init(idVideo: String = "", titleVideo: String = "", channelTitle: String = "", publishedAt: String = "", favorite: Bool = false) {
        self.idVideo = idVideo
        self.titleVideo = titleVideo
        self.channelTitle = channelTitle
        self.publishedAt = publishedAt
        self.favorite = favorite
    }
}
