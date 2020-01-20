//
//  Gardent.swift
//  baitp09+09plus
//
//  Created by user on 12/23/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import Foundation

class Gardent {

    // MARK: - Properties
    var imageName: String
    var title: String
    var subTitle: String

    // MARK: - init
    init(imageName: String = "", title: String, subTitle: String) {
        self.imageName = imageName
        self.title = title
        self.subTitle = subTitle
    }
}
