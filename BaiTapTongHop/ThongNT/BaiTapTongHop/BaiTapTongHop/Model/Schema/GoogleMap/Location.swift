//
//  Location.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

struct Location: Mappable {
    
    var latitude = 0.0
    var longtidude = 0.0
    
    init() {
    }
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        latitude    <- map["lat"]
        longtidude  <- map["lng"]
    }
    
}
