//
//  AlbumImageViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class AlbumImageViewModel {

    private let imageNames: [String]
    
    init(images: [String] = []) {
        self.imageNames = images
    }
}

extension AlbumImageViewModel {
    
    func numberOfItems() -> Int {
        return imageNames.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> ImageCellViewModel {
        return ImageCellViewModel(imageName: imageNames[indexPath.row])
    }
}
