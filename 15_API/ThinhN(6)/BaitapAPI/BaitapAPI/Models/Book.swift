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
    var name: String
    var image: UIImage?
    var urlImage: String
   
    init(json: JSON) {
        let imname = json["im:name"] as! JSON
        self.name = imname["label"] as! String
        
        let imimage = json["im:image"] as! [JSON]
        let item2 = imimage[0]
        self.urlImage = item2["label"] as! String
       
    }
}
