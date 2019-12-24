//
//  GoogleMapValue.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

struct GoogleMapValue: Mappable {
    
    var text = ""
    var value: Int?
    
    init() {
    }
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        text    <- map["text"]
        value   <- map["value"]
    }
    
}
