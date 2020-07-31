//
//  HomeViewModel.swift
//  Baitap2API
//
//  Created by ADMIN on 7/30/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var nameBooks: [String] = []
    var urlBooks: [String] = []
    var images: UIImage?
    
    func loadNameAPI(completion: @escaping Completion) {
        let urlString = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        guard let feed = json["feed"] as? JSON, let entry = feed["entry"] as? [JSON] else { return }
                        for item in entry {
                            guard let name = item["im:name"] as? JSON, let label = name["label"] as? String else {return}
                            self.nameBooks.append(label)
                        }
                        completion(true, "")
                    } else {
                        completion(false, "Data format is error")
                    }
                }
            }
        }
        task.resume()
        print("done")
    }
    
    func loadImageAPI(completion: @escaping Completion) {
        let urlString = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error ) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        guard let feed = json["feed"] as? JSON, let entry = feed["entry"] as? [JSON] else { return }
                        for item in entry {
                            guard let images = item["im:image"] as? [JSON] else {return }
                            guard let labelJS = images.last, let label = labelJS["label"] as? String else { return }
                            self.urlBooks.append(label)
                        }
                        completion(true, "")
                    } else {
                        completion(false, "Data ..")
                    }
                }
            }
        }
        task.resume()
        print("Done2")
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
        let urlImage = urlBooks[indexPath.row]
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
