//
//  HomeCellViewModel.swift
//  Baitap2API
//
//  Created by ADMIN on 7/30/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

class HomeCellViewModel {
    var bookAPI: BookAPI = BookAPI()
    
    init(bookAPI: BookAPI ) {
        self.bookAPI = bookAPI
    }
}
