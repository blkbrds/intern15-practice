//
//  DirectionService.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import GoogleMaps

enum TravelModes: String {
    case driving = "driving"
    case walking = "walking"
    case bicycling = "Bicycling"
    case transit = "transit"
}

final class DirectionService: NSObject, CLLocationManagerDelegate {

    // MARK: - Properties
    var direction: DirectionOverview?
    var selectLegs = [Leg]()
    var selectSteps = [Step]()
    var originCoordinate: CLLocationCoordinate2D?
    var destinationCoordinate: CLLocationCoordinate2D?
    var totalDistanceInMeters = 0
    var totalDistance: String {
        return "TotalDistance" + "\(totalDistanceInMeters / 1000) Km"
    }
    var totalDurationInSeconds = 0
    var totalDuration: String {
        return "TotalDuration" + "\(totalDurationInSeconds / 86400) days, " +
            "\((totalDurationInSeconds / 3600) % 24) hours, " +
            "\((totalDurationInSeconds / 60) % 60) mins, " +
            "\(totalDurationInSeconds % 60) secs"
    }


    override init() {
        super.init()
    }

    func getDirections(origin: String?, destination: String?, travelMode: TravelModes, getDirectionStatus: @escaping ((_ success: Bool) -> Void)) {
        guard let originAddress = origin else {
            getDirectionStatus(false)
            return
        }
        guard let destinationAddress = destination else {
            getDirectionStatus(false)
            return
        }

        self.parseJsonGoogleMap(directionsURLString: ApiManager.Direction.QuerryString.direction(originAddress: originAddress, destinationAddress: destinationAddress, travelMode: travelMode).url)
        { (success) in
            if success {
                print("parse ok")
                getDirectionStatus(true)
            } else {
                getDirectionStatus(false)
            }
        }
    }

    func parseJsonGoogleMap(directionsURLString: String, completion: @escaping ((_ success: Bool) -> Void)) {
        if let directionsURL = URL(string: directionsURLString) {
            guard let jsonString = try? String(contentsOf: directionsURL),
                let direction = DirectionOverview(JSONString: jsonString),
                direction.status != "" else {
                    completion(false)
                    return
            }
            print("------\(jsonString)")
            self.direction = direction
            var success = false
            if direction.status == "OK" {
                if !direction.routes.isEmpty {
                    if direction.routes[0].overviewPolyline.points != "",
                        !direction.routes[0].legs.isEmpty,
                        !direction.routes[0].legs[0].steps.isEmpty {
                        self.selectLegs = direction.routes[0].legs
                        let result = self.calculateTotalDistanceAndDuration()
                        success = result
                    }
                }
            }
            completion(success)
        } else {
            completion(false)
            return
        }
    }

    func calculateTotalDistanceAndDuration() -> Bool {
        var status = false
        for leg in self.selectLegs {
            for step in leg.steps {
                self.selectSteps.append(step)
                if let distance = step.distance.value,
                    let duration = step.duration.value {
                    totalDistanceInMeters = totalDistanceInMeters + distance
                    totalDurationInSeconds = totalDurationInSeconds + duration
                }
            }
        }
        status = true
        return status
    }
}
