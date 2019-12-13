//
//  HomeCellTabelViewModel.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/10/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
import UIKit

class HomeCellTabelViewModel {
    
    var distance: Float
    var thumnailImage: UIImage
    var addres: String
    var rating: String
    var name: String
    
    init(address: Address) {
        self.distance = address.distance
        self.thumnailImage = address.thumnailImage
        self.rating = address.rating
        self.name = address.nameImage
        self.addres = address.address
    }
}
