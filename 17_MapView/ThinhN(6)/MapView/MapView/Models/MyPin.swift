//
//  MyPin.swift
//  MapView
//
//  Created by ADMIN on 8/17/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import MapKit

class MyPin: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D

    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }

    var subtitle: String? {
        return locationName
    }
}
