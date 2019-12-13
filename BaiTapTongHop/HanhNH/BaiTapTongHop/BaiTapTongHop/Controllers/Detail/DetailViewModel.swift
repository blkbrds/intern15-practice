//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 12/13/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
import UIKit
class DetailViewModel {
    var comment: [Comment] = []
    
    func loadData(completion: (Bool) -> ()) {
        //dummydata
        comment = Comment.getDummyDatas()

        //call back
        completion(true)
    }
}
