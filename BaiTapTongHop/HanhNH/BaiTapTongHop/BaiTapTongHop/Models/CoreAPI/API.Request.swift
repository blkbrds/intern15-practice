//
//  API.Request.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
extension API {
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

//with url
    func request(url: URL, completion: @escaping (APIResult) -> Void) {
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

//with request
    func request(request: URLRequest, completion: @escaping (APIResult) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, _, error) in
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
