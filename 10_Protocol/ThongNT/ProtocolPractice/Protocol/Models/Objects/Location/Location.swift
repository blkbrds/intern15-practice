//
//  Location.swift
//  Protocol
//
//  Created by PCI0018 on 11/6/19.
//

import Foundation


class Location {
    
    var state: String
    var city: String
    var district: String
    
    init(state: String = "", city: String = "", district: String = "") {
        self.state = state
        self.city = city
        self.district = district
    }
}
