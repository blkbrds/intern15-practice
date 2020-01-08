//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class DetailViewModel {
    
    var comment: [Comment] = []

    func loadData(completion: (Bool) -> ()) {
        comment = Comment.getDummyDatas()
        completion(true)
    }
}
