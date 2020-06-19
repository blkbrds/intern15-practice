//
//  Networking.swift
//  BaiTap1API
//
//  Created by PCI0012 on 6/15/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation
import UIKit

struct EntryResult {
    var entrys: [Entry]
}

enum APIResult<T> {
    case failure(String)
    case success(T)
}

typealias APICompletion<T> = (APIResult<T>) -> Void

class Networking {
    static let shared = Networking()
    
    let urlString = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
    
    private init() {}
    
    func request(completion: @escaping APICompletion<EntryResult>) {
        var entryResults: [Entry] = []
        guard let url = URL(string: urlString) else {
            let error = APIResult<EntryResult>.failure("URL Error")
            completion(error)
            return
        }
        
        //Config
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        //Session
        let session = URLSession(configuration: config)
        
        //Connect
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure("Error"))
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let entrys = feed["entry"] as! [JSON]
                        
                        for entry in entrys {
                            let item = Entry(json: entry)
                            entryResults.append(item)
                        }
                        
                        completion(.success(EntryResult(entrys: entryResults)))
                    } else {
                        completion(.failure("Data format is error"))
                    }
                }
            }
        }
        task.resume()
    }
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil)
                } else {
                    if let data = data {
                        let image = UIImage(data: data)
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }
            }
        }
        task.resume()
    }
}
