//
//  HomeViewModel.swift
//  Baitap3API
//
//  Created by ADMIN on 7/28/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var titleVideos: [String] = []
    var titleSearch: [String] = []
    var dataAPI: [VideoAPI] = []
    var dataAPISearch: [VideoAPI] = []
    var nextPageToken: String = ""
    
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=lactroi&type=video&key=AIzaSyDMzYJLHg_ynvI_EJHdqpU9qBsoOi3f95A"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (data, response , error ) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        if let _ = json["error"] {
                            print("error")
                            completion(false, "Data format is error")
                        } else {
                            guard let items = json["items"] as? [JSON] else { return }
                            for item in items {
                                guard let snippet = item["snippet"] as? JSON, let title = snippet["title"] as? String, let publishedAt = snippet["publishedAt"] as? String, let channelTitle = snippet["channelTitle"] as? String, let thumbnail = snippet["thumbnails"] as? JSON, let defaultAPI = thumbnail["default"] as? JSON, let urlAPI = defaultAPI["url"] as? String else { return }
                                let dataAPI = VideoAPI()
                                dataAPI.titleVideo = title
                                dataAPI.channelTitle = channelTitle
                                dataAPI.publishedAt = publishedAt
                                dataAPI.url = urlAPI
                                self.dataAPI.append(dataAPI)
                                self.titleVideos.append(title)
                            }
                        }
                        completion(true, "")
                    } else {
                        completion(false, "Data format is error")
                    }
                }
            }
        }
        task.resume()
        print("done")
    }
    func loadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let _ = error {
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
    
    func search() {
        var datas: [VideoAPI] = []
        for item in dataAPI {
            for item2 in titleSearch {
                if item2 == item.titleVideo {
                    datas.append(item)
                }
            }
        }
        dataAPISearch = datas
    }
    func numberOfRowInSection() -> Int {
        return dataAPISearch.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellViewModel {
        let item = dataAPISearch[indexPath.row]
        let viewModel = HomeCellViewModel(dataAPI: item)
        return viewModel
    }
    
}
