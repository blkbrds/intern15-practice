//
//  GoogleAPIManager.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/4/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import UIKit

extension ApiManager.Places {

    struct QueryString {
        
        struct placesDetail {
            var lat: String
            var long: String
            var limit: String
            var offSet: String
            var url: String {
                return ApiManager.Path.baseURL + "venues/explore?oauth_token=3IHPZFJ0LWOKCHTHQMWAOZMX40VQV0S3PMZKNUMYZGHUP4WJ&v=20160524&ll=\(lat),\(long)&limit=\(limit)&offset=\(offSet)"
            }
        }
        
        struct placeImages {
            var idPlace: String
            var sizeOfImage: String
            var url: String {
                return ApiManager.Path.baseURL + "venues/\(idPlace)/\(sizeOfImage)/photos?oauth_token=3IHPZFJ0LWOKCHTHQMWAOZMX40VQV0S3PMZKNUMYZGHUP4WJ&v=20160524"
            }
        }
    }

    struct GoogleApiResult {
        var places: [GooglePlace]
    }

    struct ImageResult {
        var imagePlace: UIImage?
    }

    typealias Completion<T> = (Result<T, Error>) -> Void

    static func getGooglePlace(limit: Int = 20, offSet: Int = 0, completion: @escaping Completion<GoogleApiResult>) {
        API.shared().request(urlString: QueryString.placesDetail(lat: "16.070531", long: "108.224599", limit: "\(limit)", offSet: "\(offSet)").url) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON(from: data)
                    let placeResponse = PlaceResponse(notifications: json["notifications"] as? [String: Any],
                        response: json["response"] as? [String: Any])
                    guard let groups = placeResponse.response?["groups"] as? [[String: Any]] else { return }
                    var places: [GooglePlace] = []
                    for group in groups {
                        if let items = group["items"] as? [[String: Any]] {
                            for item in items {
                                if let venue = item["venue"] as? [String: Any] {
                                    var dict: [String: Any] = [:]
                                    dict["id"] = venue["id"]
                                    dict["name"] = venue["name"]
                                    dict["rating"] = venue["rating"] as? Double
                                    dict["categories"] = venue["categories"] as? [[String: Any]]
                                    let location = venue["location"] as? [String: Any]
                                    dict["address"] = location?["formattedAddress"] as? [String]
                                    dict["distance"] = location?["distance"] as? Int
                                    let googlePlace = GooglePlace(from: dict)
                                    places.append(googlePlace)
                                }
                            }
                        }
                    }
                    completion(.success(GoogleApiResult(places: places)))
                }
            }
        }
    }

    struct PlaceResponse {
        let notifications: [String: Any]?
        let response: [String: Any]?
    }
}
