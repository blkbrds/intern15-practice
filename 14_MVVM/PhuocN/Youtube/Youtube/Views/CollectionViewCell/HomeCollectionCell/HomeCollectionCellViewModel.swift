//
//  HomeCollectionCellViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

final class HomeCollectionCellViewModel {

    var imageURL: String
    var title: String
    var channel: String
    var published: String
    
    init(video: Video) {
        self.title = video.title
        self.imageURL = video.imageURL
        self.channel = video.channel
        self.published = video.published.convertToString()
    }
}
