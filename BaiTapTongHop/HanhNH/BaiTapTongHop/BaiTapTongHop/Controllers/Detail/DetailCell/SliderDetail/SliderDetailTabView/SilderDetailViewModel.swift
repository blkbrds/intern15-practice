//
//  SilderDetailViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class SilderDetailViewModel {

    var images: [String] = []

    func getDummyDatasImageSlider() {
        images = ImageSlider.getDummyDatas()
        images.append(contentsOf: images)
    }
    
    func getSliderDetailCollectionViewModel(atIndexPath indexPath: IndexPath) -> SilderDetailCollectionViewCellViewModel? {
        return SilderDetailCollectionViewCellViewModel(image: images[indexPath.row])
    }
}
