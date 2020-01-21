//
//  API.Music.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation

extension APIManager.Music {
    struct QueryString {
        func hotMusic(limit: Int) -> String {
            return "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
        }
    }

    struct QueryParam {
    }

    struct MusicResult {
        var musics: [Music]
        var copyright: String
        var updated: String
    }

    static func getHotMusic(limit: Int = 100, completion: @escaping APICompletion<MusicResult>) {
        let urlString = QueryString().hotMusic(limit: limit)

        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                //call back
                completion(.failure(error))

            case .success(let data):
                if let data = data {
                    //parse data
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    var musics: [Music] = []
                    for item in results {
                        let music = Music(json: item)
                        musics.append(music)
                    }
                    let copyright = "....."
                    let updated = "....."
                    let musicResult = MusicResult(musics: musics, copyright: copyright, updated: updated)
                    completion(.success(musicResult))
                } else {
                    completion(.failure(.error("Data is not format.")))
                }
            }
        }
    }
}
