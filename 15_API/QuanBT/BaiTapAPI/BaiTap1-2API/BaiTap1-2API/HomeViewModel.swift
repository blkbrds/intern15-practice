//
//  HomeViewModel.swift
//  BaiTap1-2API
//
//  Created by Sếp Quân on 4/12/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (Bool, String) -> Void

final class HomeViewModel {
    
    // MARK: - Properties
    var names: [String] = []
    var images: UIImage?
    var urlImages: [String] = []
    
    // MARK: - Function
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { [weak self] (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let entry = feed["entry"] as! [JSON]
                        
                        for item in entry {
                            let imname = item["im:name"] as! JSON
                            let name = imname["label"] as! String
                            self?.names.append(name)
                        }
                        completion(true, "")
                    } else {
                        completion(false, "Data format is error.")
                    }
                }
            }
        }
        task.resume()
        print("Done")
    }
    
    func loadAPIImage(completion: @escaping Completion) {
        let urlString = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { [weak self] (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let entry = feed["entry"] as! [JSON]
                        
                        for item in entry {
                            let imimage = item["im:image"] as! [JSON]
                            let item2 = imimage[0]
                            let urlImage = item2["label"] as! String
                            self?.urlImages.append(urlImage)
                        }
                        completion(true, "")
                    } else {
                        completion(false, "Data format is error.")
                    }
                }
            }
        }
        task.resume()
        print("Done")
    }
    
    private func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { [weak self] (data, _, error) in
            DispatchQueue.main.async {
                if let _ = error {
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
    
    func loadImage(at indexPath: IndexPath, completion: @escaping (Bool, String, String) -> Void) {
        let urlImage = urlImages[indexPath.row]
        downloadImage(url: urlImage) { (image) in
            if let image = image {
                self.images = image
                completion(true, "", urlImage)
            } else {
                completion(false, "", "")
            }
        }
    }
}

