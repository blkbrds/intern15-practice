//
//  Marker.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/20/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import GoogleMaps

final class Marker {
    var title: String = ""
    var snippet: String = ""
    var iconString: String = ""
    var position: Position = Position()
    
    init() { }
    
    init(title: String = "Place", snippet: String = "This is a beautiful place", iconString: String = "", lat: CLLocationDegrees , long: CLLocationDegrees) {
        self.title = title
        self.snippet = snippet
        self.iconString = iconString
        position.lat = lat
        position.long = long
    }
}

struct Position {
    var lat: CLLocationDegrees = 0
    var long: CLLocationDegrees = 0
}
