//
//  FavoritesViewModel.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class FavoritesViewModel {
    // MARK: - Properties
    private var favorites: [RealmDatas] {
        return RealmManager.shared.fetchObject(type: RealmDatas.self, completion: { result in
            switch result {
            case .failture(let error):
                print("error", error.localizedDescription)
            case .sucessful:
                print("Success")
            }
        })
    }
    var dataAPIs: [DataAPI] = []
    
    // MARK: - Function
    func numberOfRowInSection() -> Int {
        return dataAPIs.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeTableViewModel {
        let item = dataAPIs[indexPath.row]
        let viewModel = HomeTableViewModel(dataAPI: item)
        return viewModel
    }
    
    func getData() {
        for item in favorites {
            let dataAPI = DataAPI()
            dataAPI.idVideo = item.idVideo
            dataAPI.titleVideo = item.titleVideo
            dataAPI.channelTitle = item.channelTitle
            dataAPI.publishedAt = item.publishedAt
            dataAPI.url = item.url
            dataAPI.favorite = item.favorite
            self.dataAPIs.append(dataAPI)
        }
    }
    
    func getFavorites() -> [RealmDatas] {
        return favorites
    }
}
