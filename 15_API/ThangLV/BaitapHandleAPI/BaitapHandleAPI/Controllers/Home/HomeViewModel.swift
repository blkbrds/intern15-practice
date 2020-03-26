//
//  HomeViewModel.swift
//  BaitapHandleAPI
//
//  Created by PCI0008 on 2/11/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

typealias Completion = (Bool, String) -> Void

final class HomeViewModel {

    // MARK: - Properties
    var names: [String] = []
    var musics: [Music] = []

    // Load API functions
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
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
                        let results = feed["results"] as! [JSON]

                        for item in results {
                            let name = item["name"] as! String
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
        print("DONE")
    }

    func loadAPI2(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
        Networking.shared().request(with: urlString) { [weak self] (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]

                    for item in results {
                        let music = Music(json: item)
                        self?.musics.append(music)
                    }
                    completion(true, "")
                } else {
                    completion(false, "Data format is error.")
                }
            }
        }
    }

    func loadImage(at indexPath: IndexPath, completion: @escaping (Bool, String, String) -> Void) {
        let music = musics[indexPath.row]
        Networking.shared().downloadImage(url: music.artworkUrl100) { (image) in
            if let image = image {
                self.musics[indexPath.row].thumbnailImage = image
                completion(true, "", music.artworkUrl100)
            } else {
                completion(false, "", "")
            }
        }
    }
}

