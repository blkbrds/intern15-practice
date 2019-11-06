//
//  Api.Video.swift
//  DemoAPIYoutube
//
//  Created by PhuocNguyen on 10/29/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

extension ApiManager.Video {
    struct QueryString {
        func getVideoYoutube(token: String, maxResult: Int) -> String {
            return  "https://www.googleapis.com/youtube/v3/videos?pageToken=\(token)&part=contentDetails,id,snippet&chart=mostPopular&regionCode=VN&maxResults=\(maxResult)&key=\(Key.youtubeKey)"
        }
    }
    
    struct VideoResult {
        var videos: [Video]
        var pageNextToken: String
    }
    
    static func getVideo(token: String, maxResult: Int, completion: @escaping APICompletion<VideoResult>) {
        let urlString = QueryString().getVideoYoutube(token: token, maxResult: maxResult)
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.errorURL))
            return
        }
        API.shared().request(url: url) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON()
                    var videos: [Video] = []
                    var pageToken = ""
                    if let items = json["items"] as? [[String: Any]] {
                        for item in items {
                            var dict: [String: Any] = [:]
                            dict["id"] = item["id"]
                            if let snippet = item["snippet"] as? [String: Any] {
                                dict["title"] = snippet["title"]
                                dict["channelTitle"] = snippet["channelTitle"]
                                dict["publishedAt"] = snippet["publishedAt"]
                                if let thumbnails = snippet["thumbnails"] as? [String: Any],
                                    let imageURL = thumbnails["high"] as? [String: Any] {
                                    dict["imageURL"] = imageURL["url"]
                                }
                            }
                            videos.append(Video(dict: dict))
                        }
                    }
                    if let nextpageToken = json["nextPageToken"] as? String {
                        pageToken = nextpageToken
                    }
                    completion(.success(VideoResult(videos: videos, pageNextToken: pageToken)))
                } else {
                    completion(.failure(.error("Data is not format.")))
                }
            }
        }
    }
}
