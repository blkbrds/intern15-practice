//
//  HomeCellViewModel.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

class HomeCellViewModel {
    
    var dataAPI: VideoAPI
    
    init(dataAPI: VideoAPI ) {
        self.dataAPI = dataAPI
    }
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        ImageCache.loadImage(urlString: dataAPI.url, completion: completion)
    }
}

