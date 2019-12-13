//
//  ImageSlider.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
class ImageSlider {
    var imageName: String

    init(imageName: String) {
        self.imageName = imageName
    }
}
extension ImageSlider {
    static func getGetDummyDatas() -> [ImageSlider] {
        var images: [ImageSlider] = []
        for i in 1...6 {
            let image = ImageSlider(imageName: "\(i % 10)")
            images.append(image)
        }
        return images
    }
}

