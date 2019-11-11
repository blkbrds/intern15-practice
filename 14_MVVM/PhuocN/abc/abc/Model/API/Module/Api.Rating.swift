//
//  Api.Rating.swift
//  abc
//
//  Created by PhuocNguyen on 11/11/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

extension ApiManager.Rating {
    struct QueryString {
        func getRating(videoId: String) -> String {
            return "https://www.googleapis.com/youtube/v3/videos/getRating?id=\(videoId)"
        }
        
        func ratingVideoYoutube(videoId: String, rating: String) -> String {
            return "https://www.googleapis.com/youtube/v3/videos/rate?id=\(videoId)&rating=\(rating)"
        }
    }

    static func getRating(videoId: String, completion: @escaping (String?, String) -> ()) {
        let url = QueryString().getRating(videoId: videoId)
        let header = ["Accept": "application/json", "Authorization": ""]
        API.shared().request(url: url, header: header) { result in
            switch result {
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON()
                    if let items = json["items"] as? [[String: Any]] {
                        if let item = items.first as? [String: String] {
                            let rating = item["rating"]
                            print("Rating", rating)
                            completion(rating, "")
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    static func rating(videoId: String, rating: String, completion: @escaping (Bool, String) -> ()) {
        let urlString = QueryString().ratingVideoYoutube(videoId: videoId, rating: rating)
        API.shared().requestPost(url: urlString, header: [:]) { result in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let data):
                completion(true, "")
            }
        }
//        API.shared().re(parameter: parameter, url: url) { (result) in
//            switch result {
//            case .failure(let error):
//                completion(.failure(.error(error.localizedDescription)))
//            case .success(let data):
//                if let data = data {
//                    do {
//                        let jsonObj = try JSONSerialization.jsonObject(with: data, options: [])
//                        print(jsonObj)
//                    } catch {
//
//                    }
//                } else {
//                    print("fail")
//                }
//            }
//        }
    }
}
