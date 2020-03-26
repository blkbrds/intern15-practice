//
//  CustomCellViewModel.swift
//  BaitapHandleYoutubeAPI
//
//  Created by PCI0008 on 2/12/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import Foundation
import UIKit

final class CustomCellViewModel {
    var title: String
    var publishedAt: String
    var urlString: String
    
    init(title: String = "", publishedAt: String = "", urlString: String = "") {
        self.title = title
        self.publishedAt = publishedAt
        self.urlString = urlString
    }
}
