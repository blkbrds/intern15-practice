//
//  Music.swift
//  API
//
//  Created by ADMIN on 7/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

final class Music {
    var id: String
    var artistName: String
    var name: String
    var artworkUrl100: String
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        id = json["id"] as! String
        artistName = json["artistName"] as! String
        name = json["name"] as! String
        artworkUrl100 = json["artworkUrl100"] as! String
    }
}
