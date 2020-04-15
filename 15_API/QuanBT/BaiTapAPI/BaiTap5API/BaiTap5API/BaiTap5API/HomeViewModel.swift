//
//  HomeViewModel.swift
//  BaiTap5API
//
//  Created by Sếp Quân on 4/14/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (Bool, String) -> Void

final class HomeViewModel {
    // MARK: - Properties
    var dataAPIs: [DataAPI] = []
    var pageToken: [String] = ["", ""]
    
    // MARK: - Function
    func loadAPI(pageToken: String = "", completion: @escaping Completion) {
        var dataPage: [DataAPI] = []
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
                        let prevPageToken = json["prevPageToken"] as? String
                        let nextPageToken = json["nextPageToken"] as! String
                        self.pageToken[0] = prevPageToken ?? ""
                        self.pageToken[1] = nextPageToken
                        let items = json["items"] as! [JSON]
                        for item in items {
                            let snippet = item["snippet"] as! JSON
                            let dataAPI = DataAPI()
                            dataAPI.titleVideo = snippet["title"] as! String
                            dataAPI.channelTitle = snippet["channelTitle"] as! String
                            dataAPI.publishedAt = snippet["publishedAt"] as! String
                            let thumbnails = snippet["thumbnails"] as! JSON
                            let defaultAPI = thumbnails["default"] as! JSON
                            let urlAPI = defaultAPI["url"] as! String
                            dataAPI.url = urlAPI
                            dataPage.append(dataAPI)
                        }
                        self.dataAPIs = dataPage
                        completion(true, "")
                    } else {
                        completion(false, "Data format is error.")
                    }
                }
            }
        }
        task.resume()
        print("Done")
    }
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
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
    
    func numberOfRowInSection() -> Int {
        return dataAPIs.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellViewModel {
        let item = dataAPIs[indexPath.row]
        let viewModel = HomeCellViewModel(dataAPI: item)
        return viewModel
    }
}
