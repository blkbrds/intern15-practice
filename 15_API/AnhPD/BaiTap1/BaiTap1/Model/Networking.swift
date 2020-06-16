//
//  Networking.swift
//  BaiTap1
//
//  Created by PCI0012 on 6/5/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

typealias CompletionHandler = (Data?, APIError?) -> Void

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error"
        }
    }
}

final class Networking {
    private static var sharedNetworking: Networking = {
        let networking = Networking()
        return networking
    }()
    
    class func shared()-> Networking {
        return sharedNetworking
    }
    
    private init() {}
    
    func request(with urlString: String, completion: @escaping CompletionHandler) {
        guard let url = URL(string: urlString) else {
            let error = APIError.error("URL loi")
            completion(nil,error)
            return
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, APIError.error(error.localizedDescription))
                } else {
                    if let data = data {
                        completion(data, nil)
                    } else {
                        completion(nil, APIError.error("Data Format is error"))
                    }
                }
            }
        }
        task.resume()
    }
}
