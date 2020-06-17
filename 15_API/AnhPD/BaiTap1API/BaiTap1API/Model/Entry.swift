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
    var labelName: String = ""
    var labelPrice: String = ""
    var labelArtist: String = ""
    var labelImage: String = ""
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        if let nameJS = json["im:name"] as? JSON, let name = nameJS["label"] as? String {
            self.labelName = name
        }
        
        if let priceJS = json["im:price"] as? JSON, let price = priceJS["label"] as? String {
            self.labelPrice = price
        }
        
        if let artistJS = json["im:artist"] as? JSON, let artist = artistJS["label"] as? String {
            self.labelArtist = artist
        }
        
        if let imageJS = json["im:image"] as? [JSON] {
            let image = imageJS[2]
            if let image = image["label"] as? String {
                self.labelImage = image
            }
        }
    }
}
