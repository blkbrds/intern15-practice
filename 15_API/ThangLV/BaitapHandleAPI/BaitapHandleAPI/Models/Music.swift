//
//  Music.swift
//  BaitapHandleAPI
//
//  Created by PCI0008 on 2/11/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import Foundation
import UIKit

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error"
        }
    }
}

final class Music {
    var id: String
    var artistName: String
    var releaseDate: String
    var name: String
    var artworkUrl100: String
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        id = json["id"] as? String ?? ""
        artistName = json["artistName"] as? String ?? ""
        releaseDate = json["releaseDate"] as? String ?? ""
        name = json["name"] as? String ?? ""
        artworkUrl100 = json["artworkUrl100"] as? String ?? ""
    }
}