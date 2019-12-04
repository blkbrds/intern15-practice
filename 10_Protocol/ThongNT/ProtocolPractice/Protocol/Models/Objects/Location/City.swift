//
//  City.swift
//  Protocol
//
//  Created by PCI0018 on 11/6/19.
//

import Foundation

final class City {
    
    var name: String
    var district: [District]
    
    init(name: String, district: [District]) {
        self.name = name
        self.district = district
    }
}
