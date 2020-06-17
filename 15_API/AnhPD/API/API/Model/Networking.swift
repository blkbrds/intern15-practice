//
//  Networking.swift
//  API
//
//  Created by PCI0012 on 6/17/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

struct ItemResult {
    var items: [Item]
}

enum APIResult<T> {
    case failure(String)
    case success(T)
}

//MARK: - Typealias
typealias APICompletion<T> = (APIResult<T>) -> Void

class Networking {
    
    //MARK: - Function
    func request(urlString: String, completion: @escaping APICompletion<ItemResult>) {
        var items: [Item] = []
        guard let url = URL(string: urlString) else {
            let error = APIResult<ItemResult>.failure("URL Fail")
            completion(error)
            return
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { (data, ressponse, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure("Error"))
                } else {
                    if let data = data {
                        completion(.success(ItemResult(items: items)))
                    } else {
                        completion(.failure("Data format is error"))
                    }
                }
            }
        }
        task.resume()
    }
}
