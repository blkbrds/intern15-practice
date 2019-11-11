//
//  APIRequest.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 8/26/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
import UIKit

extension API {
    typealias completion = (APIResult) -> Void
    
    func request(urlString: String, completion: @escaping completion) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.errorURL))
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
    
    func request(url: URL, completion: @escaping completion) {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.timeoutIntervalForResource = 15
        //config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
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
    
    func request(url: String, header: [String: String] = [:], completion: @escaping completion) {
        guard let url = URL(string: url) else {
            completion(.failure(.errorURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        guard let youtubeAccessToken = UserDefaults.standard.value(forKey: "youtubeAccessToken") as? String else {
            completion(.failure(.errorAccessToken))
            return
        }
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(youtubeAccessToken)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        print(data)
                        completion(.success(data))
                    }
                }
            }
        }.resume()
    }
    
    func requestPost(url: String, header: [String: String] = [:], completion: @escaping completion) {
        guard let url = URL(string: url) else {
            completion(.failure(.errorURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let youtubeAccessToken = UserDefaults.standard.value(forKey: "youtubeAccessToken") as? String else {
            completion(.failure(.errorAccessToken))
            return
        }
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(youtubeAccessToken)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 10
        session.configuration.timeoutIntervalForResource = 10
        session.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                print(httpResponse.statusCode)
                DispatchQueue.main.async {
                    if let error = error {
                        completion(.failure(.error(error.localizedDescription)))
                    } else {
                        if let data = data {
                            print(data)
                            completion(.success(data))
                        }
                    }
                }
            } else {
                completion(.failure(.errorResponse))
            }
        }.resume()
    }
}
