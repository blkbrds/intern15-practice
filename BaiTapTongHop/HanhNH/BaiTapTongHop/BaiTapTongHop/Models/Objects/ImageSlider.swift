//
//  ImageSlider.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class ImageSlider {
    var imageName: String

    init(imageName: String) {
        self.imageName = imageName
    }
}
extension ImageSlider {
    static func getDummyDatas() -> [ImageSlider] {
        var images: [ImageSlider] = []
        for i in 1...6 {
            let image = ImageSlider(imageName: "\(i % 10)")
            images.append(image)
        }
        return images
    }
}
