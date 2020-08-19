//
//  Book.swift
//  BaitapAPI
//
//  Created by ADMIN on 8/11/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

class Book {
    var name: String = ""
    var image: UIImage?
    var urlImage: String = ""
    
    init(json: JSON) {
        if let imname = json["im:name"] as? JSON, let name = imname["label"] as? String {
            self.name = name
        } 
        if let imimage = json["im:image"] as? [JSON] {
            let item = imimage[0]
            if let image = item["label"] as? String {
                self.urlImage = image
            }
        }
    }
}
