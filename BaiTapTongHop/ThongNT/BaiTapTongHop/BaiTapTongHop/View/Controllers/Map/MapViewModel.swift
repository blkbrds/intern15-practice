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

    func createMarkers() {
        for place in places {
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: place.position.lat, longitude: place.position.long))
            marker.title = place.name
            marker.snippet = place.address
            marker.appearAnimation = .pop
            markers.append(marker)
        }
    }
    
    func getPlaceSelected(with idPlace: String) -> GooglePlace {
        for place in places {
            if place.idPlace == idPlace {
                return place
            }
        }
        return GooglePlace()
    }

    func getPoints(currentLocation: CLLocation , destinationLocation: CLLocation, travelMode: TravelModes, completed: @escaping (Bool, String) -> Void) {
        
        var locationA: String {
            return String(currentLocation.coordinate.latitude) + "," + String(currentLocation.coordinate.longitude)
        }
        var locationB: String {
            return String(destinationLocation.coordinate.latitude) + "," + String(destinationLocation.coordinate.longitude)
        }
        ApiManager.Direction.getDirectionPoints(originLocation: locationA, destinationLocation: locationB, travelMode: .driving) { (result) in
            switch result {
            case .failure(let error):
                completed(false, error.localizedDescription)
            case .success(let points):
                completed(true, points.points)
            }
        }
    }
}
