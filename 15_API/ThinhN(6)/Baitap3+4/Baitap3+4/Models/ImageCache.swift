//
//  ImageCache.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/22/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

class ImageCache {
    
    static var cache: [String: UIImage] = [:]
    
    static func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let image = cache[urlString] {
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
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    cache[urlString] = image
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}
