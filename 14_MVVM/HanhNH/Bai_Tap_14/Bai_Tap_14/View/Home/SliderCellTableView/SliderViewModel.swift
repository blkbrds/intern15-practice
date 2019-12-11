//
//  SliderViewModel.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/10/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
class SliderViewModel {
    var images: [ImageSlider] = []
    
    func loadData(completion: (Bool) -> ()) {
        
        images = ImageSlider.getGetDummyDatas()
        
        completion(true)
    }
}
