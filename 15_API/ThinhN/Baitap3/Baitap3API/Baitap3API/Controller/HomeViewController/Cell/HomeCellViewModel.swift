//
//  HomeCellViewModel.swift
//  Baitap3API
//
//  Created by ADMIN on 7/28/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

class HomeCellViewModel {
    var dataAPI: VideoAPI = VideoAPI()
    
    init(dataAPI: VideoAPI = VideoAPI()) {
        self.dataAPI = dataAPI
    }
}
