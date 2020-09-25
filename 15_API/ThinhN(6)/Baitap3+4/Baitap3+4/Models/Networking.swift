//
//  Networking.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

typealias APICompletion<T> = (APIResult<T>) -> Void

class Networking {
    
    var urlString =  "https://www.googleapis.com/youtube/v3/search?part=snippet&q=lactroi&type=video&key=AIzaSyDMzYJLHg_ynvI_EJHdqpU9qBsoOi3f95A"
    private static var shareAPI: Networking = {
        let networking = Networking()
        return networking
    }()
    
    class func shared() -> Networking {
        return shareAPI
    }
    private init() {}
    
    func request(completion: @escaping(APICompletion<DataAPI>)) {
        guard let url = URL(string: urlString) else {
            let error = APIResult<DataAPI>.error("URL Error ")
            completion(error)
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) {(data, response, error ) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(APIResult<DataAPI>.error("Error "))
                    return
                }
                var videos: [VideoAPI] = []
                if let data = data {
                    let json = data.toJSON()
                    guard let items = json["items"] as? [JSON] else {return }
                    for item in items {
                        if let snippet = item["snippet"] as? JSON {
                            let video = VideoAPI(snippet: snippet)
                            videos.append(video)
                        }
                    }
                }
                completion(.success(DataAPI(videos: videos)))
            }
        }
        task.resume()
    }
}
