//
//  APIManager.swift
//  BaitapAPI
//
//  Created by ADMIN on 8/11/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

class Networking {
    
    static var cache: [String: UIImage] = [:]
    static var urlString = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
    
    private static var shareAPI: Networking = {
        let networking = Networking()
        return networking
    }()
    
    class func shared() -> Networking  {
        return shareAPI
    }
    
    private init() {}
    
    func request(with urlString: String, completion: @escaping (Data?, APIError?) -> Void) {
        guard let url = URL(string: urlString) else {
            let error = APIError.error("URL Failed")
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
    
    func dowloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let image = Networking.cache[urlString] {
            completion(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    Networking.cache[urlString] = image
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}

