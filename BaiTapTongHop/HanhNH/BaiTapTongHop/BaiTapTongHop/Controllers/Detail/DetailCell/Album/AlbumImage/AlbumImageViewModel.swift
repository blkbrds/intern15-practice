//
//  AlbumImageViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class AlbumImageViewModel {

    private let images: [String]
    
    init(images: [String] = []) {
        self.images = images
    }
}

extension AlbumImageViewModel {
    
    func numberOfItem() -> Int {
        return images.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> ImageCellViewModel {
        return ImageCellViewModel(image: images[indexPath.row])
    }
}
