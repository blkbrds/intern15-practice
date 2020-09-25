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
    var dataAPI: [VideoAPI] = []
    var dataAPISearch: [VideoAPI] = []

    func loadAPI(completion: @escaping Completion) {
        Networking.shared().request { (apiResult: APIResult<DataAPI>) in
            switch apiResult {
            case.error(let stringError):
                completion(false, stringError)
            case.success(let result):
                self.dataAPI = result.videos
                self.dataAPISearch.append(contentsOf: self.dataAPI)
                completion(true, nil)
            }
        }
    }
    func search(_ searchText: String) {
        dataAPISearch.removeAll()
        guard !searchText.isEmpty else {
            dataAPISearch.append(contentsOf: dataAPI)
            return
        }
        for item in dataAPI {
            if item.titleVideo.uppercased().contains(searchText.uppercased()) {
                dataAPISearch.append(item)
            }
        }
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
