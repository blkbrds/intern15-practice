//
//  APIManager.swift
//  BaitapAPI
//
//  Created by ADMIN on 8/11/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

typealias APICompletion<T> = (APIResult<T>) -> Void

class Networking {
    
    static var cache: [String: UIImage] = [:]
    var urlString = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
    
    private static var shareAPI: Networking = {
        let networking = Networking()
        return networking
    }()
    
    class func shared() -> Networking  {
        return shareAPI
    }
    
    private init() {}
    
    func request(completion: @escaping APICompletion<DataAPIResult>) {
        var books: [Book] = []
        guard let url = URL(string: urlString) else {
            let error = APIResult<DataAPIResult>.failure("URL Error")
            completion(error)
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    completion(.failure("Error"))
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        guard let feed = json["feed"] as? JSON, let entry = feed["entry"] as? [JSON] else { return }
                        for item in entry {
                            let book = Book(json: item)
                            books.append(book)
                        }
                        completion(.success(DataAPIResult(dataAPI: books)))
                        
                    } else {
                        completion(.failure("Data format is error"))
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

