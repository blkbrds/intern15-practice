//
//  HomeViewModel.swift
//  API
//
//  Created by ADMIN on 7/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var names: [String] = []
    var musics: [Music] = []
    
    func numberOfRowsInSection() -> Int {
        return musics.count
    }
    
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/vn/itunes-music/top-songs/all/10/explicit.json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    //call back
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let results = feed["results"] as! [JSON]
                        
                        for item in results {
                            let name = item["name"] as! String
                            self.names.append(name)
                        }
                        //call back
                        completion(true, "")
                    } else {
                        //call back
                        completion(false, "Data format is error")
                    }
                }
            }
        }
        task.resume()
        print("DONE MISSION")
    }
    func loadAPI2(completion: @escaping Completion) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/vn/itunes-music/top-songs/all/10/explicit.json"
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    
                    for item in results {
                        let music = Music(json: item)
                        self.musics.append(music)
                        
                        completion(true, "")
                    }
                } else {
                    completion(false, "Data format is error.")
                }
            }
        }
    }
}
