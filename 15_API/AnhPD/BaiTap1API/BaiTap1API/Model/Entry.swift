//
//  Entry.swift
//  BaiTap1API
//
//  Created by PCI0012 on 6/16/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation
import UIKit

class Entry {
    var labelName: String
    var labelPrice: String
    var labelArtist: String
    var labelImage: String
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        let name = json["im:name"] as! JSON
        self.labelName = name["label"] as! String
        
        let price = json["im:price"] as! JSON
        self.labelPrice = price["label"] as! String
        
        let artist = json["im:artist"] as! JSON
        self.labelArtist = artist["label"] as! String
        
        let images = json["im:image"] as! [JSON]
        let image = images[2]
        self.labelImage = image["label"] as! String
    }
}
