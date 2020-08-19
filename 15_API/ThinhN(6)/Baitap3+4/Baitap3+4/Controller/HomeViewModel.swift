//
//  HomeViewModel.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (Bool, String?) -> Void

class HomeViewModel {
    var titleVideos: [String] = []
    var titleSearchs: [String] = []
    var dataAPI: [DataAPI] = []
    var dataAPISearch: [DataAPI] = []
    static var cache: [String: UIImage] = [:]
    
    func loadAPI(completion: @escaping Completion) {
        let urlString = Networking.urlString
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    guard let items = json["items"] as? [JSON] else {return }
                    for item in items {
                        guard let snippet = item["snippet"] as? JSON, let title = snippet["title"] as? String, let publishedAt = snippet["publishedAt"] as? String, let channelTitle = snippet["channelTitle"] as? String, let thumbnail = snippet["thumbnails"] as? JSON, let defaultAPI = thumbnail["default"] as? JSON, let urlAPI = defaultAPI["url"] as? String else { return }
                        let dataAPI = DataAPI()
                        dataAPI.titleVideo = title
                        dataAPI.channelTitle = channelTitle
                        dataAPI.publishedAt = publishedAt
                        dataAPI.url = urlAPI
                        self.dataAPI.append(dataAPI)
                        self.titleVideos.append(title)
                    }
                    completion(true, nil)
                }
                else {
                    completion(false, "Data format is error ")
                }
            }
        }
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let image = HomeViewModel.cache[urlString] {
            completion(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    HomeViewModel.cache[urlString] = image
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
        task.resume()
    }
    func search() {
        var datas: [DataAPI]  = []
        for item in dataAPI {
            for item2 in titleSearchs {
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
