//
//  Networking.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class Networking {
    private static var sharedNetworking: Networking = {
        let networking = Networking()
        return networking
    }()

    class func shared() -> Networking {
        return sharedNetworking
    }

    //MARK: - init
    private init() { }

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

