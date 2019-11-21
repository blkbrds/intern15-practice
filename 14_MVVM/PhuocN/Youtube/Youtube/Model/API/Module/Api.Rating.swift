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
        API.shared().requestPost(url: urlString) { result in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
                print(error.localizedDescription)
            case .success(_):
                completion(true, "")
            }
        }
    }
}
