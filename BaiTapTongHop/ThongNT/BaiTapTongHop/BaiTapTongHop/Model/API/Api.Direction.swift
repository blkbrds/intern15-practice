//
//  Api.Direction.swift
//  BaiTapTongHop

import Foundation
import Alamofire

extension ApiManager.Direction {
    
    struct DirectionResult {
        var points: String
    }

    struct QuerryString {
        struct direction {
            var originLocation: String
            var destinationLocation: String
            var travelMode: TravelModes
            var url: String {
                return ApiManager.Path.baseURLDirection + "origin=" +
                    originLocation + "&destination=" + destinationLocation + "&mode=" + travelMode.rawValue + "&key=" + ApiManager.Key.GoogleAPI
            }
        }
    }

    //Rrequesting Alamofire
    static func getDirectionPoints(originLocation: String, destinationLocation: String, travelMode: TravelModes, completion: @escaping Completion<DirectionResult>) {
        let url: String = QuerryString.direction.init(originLocation: originLocation, destinationLocation: destinationLocation, travelMode: travelMode).url
        Alamofire.request(url).responseJSON { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }
            let json = data.convertToJSON(from: data)
            guard let routes = json["routes"] as? [[String: Any]] else { return }
            var pointsResult: String = ""
            for route in routes {
                let routeOverviewPolyline = route["overview_polyline"] as? [String: Any]
                if let points = routeOverviewPolyline?["points"] as? String  {
                    pointsResult = points
                }
            }
            completion(.success(DirectionResult(points: pointsResult)))
        }
    }
}
