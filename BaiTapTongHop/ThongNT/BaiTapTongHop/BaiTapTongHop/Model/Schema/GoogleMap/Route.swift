//
//  Route.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

struct Route: Mappable {
    
    var bounds = Bounds()
    var copyrights = ""
    var legs = [Leg]()
    var overviewPolyline = Polyline()
    var summary = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        bounds              <- map["bounds"]
        copyrights          <- map["copyrights"]
        legs                <- map["legs"]
        overviewPolyline    <- map["overview_polyline"]
        summary             <- map["summary"]
    }
}
