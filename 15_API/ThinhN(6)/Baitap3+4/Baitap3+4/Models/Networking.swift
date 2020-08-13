//
//  Networking.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

class Networking {
    
    static var urlString =  "https://www.googleapis.com/youtube/v3/search?part=snippet&q=lactroi&type=video&key=AIzaSyDMzYJLHg_ynvI_EJHdqpU9qBsoOi3f95A"
    private static var shareAPI: Networking = {
        let networking = Networking()
        return networking
    }()
    
    class func shared() -> Networking {
        return shareAPI
    }
    private init() {}
    
    func request(with urlString: String, completion: @escaping (Data?, APIError?) -> Void ) {
        guard let url = URL(string: urlString) else {
            let error = APIError.error("URL Failed ")
            completion(nil, error)
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error ) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, APIError.error(error.localizedDescription))
                } else {
                    if let data = data {
                        completion(data, nil)
                    } else {
                        completion(nil, APIError.error("Data format is error "))
                    }
                }
            }
        }
        task.resume()
    }
}
