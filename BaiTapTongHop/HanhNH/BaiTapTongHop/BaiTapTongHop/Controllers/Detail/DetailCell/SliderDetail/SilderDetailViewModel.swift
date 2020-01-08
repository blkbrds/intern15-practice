//
//  SilderDetailViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class SliderDetailViewModel {

    var images: [ImageSlider] = []

    func loadData(completion: (Bool) -> ()) {
        images = ImageSlider.getDummyDatas()
        completion(true)
    }
}
