//
//  Avatar.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/10/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class Avatar {
    var name: String
    var nameImage: String
    
    init(name: String, nameImage: String = "") {
        self.name = name
        self.nameImage = nameImage
    }
}
