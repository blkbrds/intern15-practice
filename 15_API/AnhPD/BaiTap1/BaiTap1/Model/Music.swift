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
        if let id = json["id"] as? String {
            self.id = id
        } else {
            self.id = ""
        }
        
        if let artistName = json["artistName"] as? String {
            self.artistName = artistName
        } else {
            self.artistName = ""
        }
        
        if let name = json["name"] as? String {
            self.name = name
        } else {
            self.name = ""
        }
        
        if let releaseDate = json["releaseDate"] as? String {
            self.releaseDate = releaseDate
        } else {
            self.releaseDate = ""
        }
        
        if let artworkUrl100 = json["artworkUrl100"] as? String {
            self.artworkUrl100 = artworkUrl100
        } else {
            self.artworkUrl100 = ""
        }
    }
}
