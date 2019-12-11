//
//  ImageSlider.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
class ImageSlider {
    var imageSlider: String
    
    init(image: String) {
        self.imageSlider = image
    }
}
extension ImageSlider {
    static func getGetDummyDatas() -> [ImageSlider]  {
        var images: [ImageSlider] = []
        
        for i in 1...5 {
            let image = ImageSlider(image: "\(i%10)")
            images.append(image)
        }
        return images
    }
}

