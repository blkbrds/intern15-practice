//
//  HomeViewModel .swift
//  BaitapHandleYoutubeAPI
//
//  Created by PCI0008 on 2/12/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import Foundation

typealias Completion = (Bool, String) -> Void

final class HomeViewModel {
    var isLoading = false
    var posts: [Post] = []
    var thumbnails: [Thumbnail] = []
    var nextPageToken: String = ""
    var prevPageToken: String = ""
    
    func loadAPI(pageToken: String = "" ,completion: @escaping Completion) {
        let urlString = "https://www.googleapis.com/youtube/v3/search?pageToken=\(pageToken)&part=snippet&maxResults=25&order=relevance&q=lactroi&key=AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
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
                        self.nextPageToken = json["nextPageToken"] as! String
                        self.prevPageToken = json["prevPageToken"] as? String ?? ""
                        let items = json["items"] as! JSONArray
                        
                        for item in items {
                            let snippet = item["snippet"] as! JSONObject
                            let thumbnails = snippet["thumbnails"]  as! JSONObject
                            let medium = thumbnails["default"] as! JSONObject
                            let url = Thumbnail(json: medium)
                            let post = Post(json: snippet)
                            self.thumbnails.append(url)
                            self.posts.append(post)
                        }
                        
                        completion(true, "")
                    } else {
                        completion(false, "Data format is error")
                    }
                }
            }
        }
        task.resume()
        print("DONE")
    }
    
    func viewModelForItem(indexPath: IndexPath) -> CustomCellViewModel {
        let title = posts[indexPath.row].title
        let publishedAt = posts[indexPath.row].publishedAt
        let urlString = thumbnails[indexPath.row].url
        return CustomCellViewModel(title: title, publishedAt: publishedAt, urlString: urlString)
    }
}
