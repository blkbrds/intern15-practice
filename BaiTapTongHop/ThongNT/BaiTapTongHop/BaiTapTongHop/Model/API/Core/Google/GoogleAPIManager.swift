//
//  GoogleAPIManager.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/4/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class GoogleAPIManager {
    
    private var places: [Place] = []
    
    func evolutionChains(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://api.foursquare.com/v2/venues/explore?oauth_token=3IHPZFJ0LWOKCHTHQMWAOZMX40VQV0S3PMZKNUMYZGHUP4WJ&v=20160524&ll=16.070531,108.224599&limit=10&offset=0") else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, respone, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                let response = PlaceResponse(count: json["count"] as? Int, previous: json["previous"] as? String, results: json["results"] as? [[String: Any]], next: json["next"] as? String)
                guard let results = response.results else {
//                    self.revolutions = []
                    return
                }
                var revolutions: [String] = []
                for result in results {
                    if let revolution = result["url"] as? String {
                        revolutions.append(revolution)
                    }
                }
//                self.revolutions = revolutions
            }
            completion()
        }
        task.resume()
    }
    
    private func convertToJSON(from data : Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("Json casting error")
        }
        return json
    }
}

struct PlaceResponse {
    let count: Int?
    let previous: String?
    let results: [[String: Any]]?
    let next: String?
}
