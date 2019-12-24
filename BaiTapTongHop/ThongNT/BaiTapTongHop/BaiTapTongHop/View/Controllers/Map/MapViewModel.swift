//
//  MapViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/20/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import MVVM
import GoogleMaps

final class MapViewModel: ViewModel {
    
    // MARK: - Properties
    var places: [GooglePlace] = []
    var markers: [GMSMarker] = []
    
    func createMakers() {
        for place in places {
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: place.position.lat, longitude: place.position.long))
            marker.title = place.name
            marker.snippet = place.address
            marker.appearAnimation = .pop
            markers.append(marker)
        }
    }
}
