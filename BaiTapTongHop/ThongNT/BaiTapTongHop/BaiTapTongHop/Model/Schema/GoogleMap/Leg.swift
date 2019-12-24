//
//  Leg.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

struct Leg: Mappable {
    
    var distance = GoogleMapValue()
    var duration = GoogleMapValue()
    var endAddress = ""
    var endLocation = Location()
    var startAddress = ""
    var startLocation = Location()
    var steps = [Step]()
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        distance           <- map["distance"]
        duration           <- map["duration"]
        endAddress         <- map["end_address"]
        endLocation        <- map["end_location"]
        startAddress       <- map["start_address"]
        startLocation      <- map["start_location"]
        steps              <- map["steps"]
    }
    
}
