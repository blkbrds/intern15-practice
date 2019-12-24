//
//  GeocodedWaypoint.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

struct GeocodedWaypoint: Mappable {
    
    var geocoderStatus = ""
    var placeId = ""
    var types = [String]()
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        geocoderStatus <- map["geocoder_status"]
        placeId        <- map["place_id"]
        types          <- map["types"]
    }
    
}
