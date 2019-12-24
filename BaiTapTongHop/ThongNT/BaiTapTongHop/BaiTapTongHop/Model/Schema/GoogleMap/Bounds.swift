//
//  Bounds.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

struct Bounds: Mappable {
    
    var northeast = Location()
    var southwest = Location()
    
    init() {
    }
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        northeast   <- map["northeast"]
        southwest   <- map["southwest"]
    }
    
}
