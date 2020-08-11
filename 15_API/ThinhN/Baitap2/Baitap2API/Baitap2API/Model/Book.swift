//
//  BookAPI.swift
//  Baitap2API
//
//  Created by ADMIN on 7/29/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

final class Book {
    var name: String
    var image: UIImage?
    var urlImage: String
    
    init(name: String = "", urlImage: String = "") {
        self.name = name
        self.urlImage = urlImage
    }
}
