//
//  File.swift
//  ExerciseTableView
//
//  Created by TranVanTien on 12/7/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

class Gardent {
    
    // MARK: - Properties
    var imageName: String
    var title: String
    var subTitle: String
    
    // MARK: - init
    init(imageName: String = "", title: String, subTitle: String ) {
        self.imageName = imageName
        self.title = title
        self.subTitle = subTitle
    }
}
