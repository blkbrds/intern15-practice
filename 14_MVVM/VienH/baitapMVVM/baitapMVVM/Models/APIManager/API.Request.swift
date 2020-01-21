//
//  API.Request.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation

extension API {

    //with url string
    func request(urlString: String, completion: @escaping (APIResult) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }

        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }
        dataTask.resume()
    }
}
