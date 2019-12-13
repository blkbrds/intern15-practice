//
//  SilderViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 12/13/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
class SliderDetailViewModel {
    
    var images: [ImageSlider] = []

    func loadData(completion: (Bool) -> ()) {
        images = ImageSlider.getGetDummyDatas()
        completion(true)
    }
}
