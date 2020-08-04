//
//  AbillityDetailViewModel.swift
//  Baitapbosung
//
//  Created by ADMIN on 8/3/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

class AbilityDetailViewModel {
    var url: String
    var names: [String] = []
    
    init(url: String) {
        self.url = url
    }
    func loadAPI(completion: @escaping Completion) {
        let urlString = url
        let url1 = URL(string: urlString)
        var request = URLRequest(url: url1!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) {(data, response, error ) in DispatchQueue.main.async {
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    guard let pokemon = json["pokemon"] as? [JSON] else { return }
                    for item in pokemon {
                        guard let pokemon = item["pokemon"] as? JSON, let name = pokemon["name"] as? String else { return }
                        self.names.append(name)
                    }
                    completion(true, "")
                } else {
                    completion(false, "Data ...")
                }
            }
            }
        }
        task.resume()
    }
}
