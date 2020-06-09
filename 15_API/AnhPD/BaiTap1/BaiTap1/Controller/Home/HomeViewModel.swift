//
//  HomeViewModel.swift
//  BaiTap1
//
//  Created by PCI0012 on 6/5/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var names: [String] = []
    var musics: [Music] = []
    
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/10/explicit.json"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
//        request.httpMethod = "GET"
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
                        let feed = json["feed"] as! JSON
                        let results = feed["results"] as! [JSON]
                        
                        for item in results {
                            let name = item["name"] as! String
                            self.names.append(name)
                        }
                        
                        completion(true, "")
                    } else {
                                 
                    }
                }
            }
        }
        task.resume()
    }
    
    func loadAPI2(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/10/explicit.json"
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let result = feed["results"] as! [JSON]
                    
                    for item in result {
                        let music = Music(json: item)
                        self.musics.append(music)
                        
                        completion(true, "")
                    }
                } else {
                    completion(false, "Data format is error")
                }
            }
        }
    }
    
    func viewModelCellForAtRow(indexPath: IndexPath) -> HomeCellViewModel {
        let item = musics[indexPath.row]
        let viewModel = HomeCellViewModel(music: item)
        return viewModel
    }
}

