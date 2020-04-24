//
//  HomeViewModel.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (Bool, String) -> Void

final class HomeViewModel {
    // MARK: - Properties
    var dataAPIs: [DataAPI] = []
    var pageToken: [String] = ["", "CBkQAA", "CDIQAA", "CEsQAA", "CGQQAA"]
    
    // MARK: - Function
    func loadAPI(pageToken: String = "", completion: @escaping Completion) {
        var dataPage: [DataAPI] = []
        let urlString = "https://www.googleapis.com/youtube/v3/search?pageToken=\(pageToken)&part=snippet&maxResults=25&order=relevance&q=lactroi&key=AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let items = json["items"] as? [JSON] ?? [JSON]()
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
    
    func numberOfRowInSection() -> Int {
        return dataAPIs.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeTableViewModel {
        let item = dataAPIs[indexPath.row]
        let viewModel = HomeTableViewModel(dataAPI: item)
        return viewModel
    }
}
