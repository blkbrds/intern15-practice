//
//  Api.Downloader.swift
//  DemoAPIYoutube
//
//  Created by PhuocNguyen on 10/29/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import UIKit

extension ApiManager.Downloader {
    static let imageCache = NSCache<AnyObject, AnyObject>()
    
    static func downloadImage(imageURL: String, index: Int, completion: @escaping (UIImage?, Int) -> Void) {
        if let cacheImage = imageCache.object(forKey: (imageURL as NSString)) as? UIImage {
            completion(cacheImage, index)
        }
        API.shared().request(urlString: imageURL) { (result) in
            switch result {
            case .failure(_):
                completion(nil, index)
            case .success(let data):
                if let data = data,
                    let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: (imageURL as NSString))
                    completion(image, index)
                } else {
                    completion(nil, index)
                }
            }
        }
    }
}
