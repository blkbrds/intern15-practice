//
//  HomeViewModel.swift
//  Bai1Vs2API
//
//  Created by PCI0002 on 4/23/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

typealias Completion = (Bool, String) -> Void

final class HomeViewModel {
//    var names: [String] = []
    var musics: [Music] = []
    func loadAPI(completion: @escaping Completion) {
        //create request
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
//                    print("LOAD API FAILED")
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let entry = feed["entry"] as! [JSON]
                        for item in entry {
//                            let imname = item["im:name"] as! JSON
//                            let label = imname["label"] as! String
//                            self.names.append(label)
//                            print(self.names)
                            let music = Music(json: item)
                            self.musics.append(music)
                            
                            completion(true, "")
                        }
                        //call Back
//                        completion(true, "")
                    } else {
                        //call back
                        completion(false, "Data Format Is Error")
                    }
                }
            }
        }
        task.resume()
        print("DONE")
    }
    
    
}
