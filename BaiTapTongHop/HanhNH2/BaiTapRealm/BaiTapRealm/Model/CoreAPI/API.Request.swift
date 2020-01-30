//
//  API.Request.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

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
                    completion(.failure(error))
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
                    completion(.failure(error))
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
                    completion(.failure(error))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }
        dataTask.resume()
    }

    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        let cofig = URLSessionConfiguration.ephemeral
        cofig.waitsForConnectivity = true
        let session = URLSession(configuration: cofig)
        let task = session.dataTask(with: url) { data, respone, error in
            DispatchQueue.main.async {
                if error != nil {
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
