//
//  Music.swift
//  BaiTap1
//
//  Created by PCI0012 on 6/5/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

final class Music {
    var id: String
    var artistName: String
    var name: String
    var releaseDate: String
    var artworkUrl100: String
    
    init(json: JSON) {
        self.id = json["id"] as! String
        self.artistName = json["artistName"] as! String
        self.name = json["name"] as! String
        self.releaseDate = json["releaseDate"] as! String
        self.artworkUrl100 = json["artworkUrl100"] as! String
    }
}
