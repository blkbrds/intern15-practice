//
//  DirectionOverview.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

struct DirectionOverview: Mappable {
    
    var geocodedWaypoints = [GeocodedWaypoint]()
    var routes = [Route]()
    var status = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        geocodedWaypoints <- map["geocoded_waypoints"]
        routes            <- map["routes"]
        status            <- map["status"]
    }
}
