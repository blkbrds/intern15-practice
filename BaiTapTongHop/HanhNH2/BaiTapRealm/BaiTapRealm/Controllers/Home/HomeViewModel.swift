//
//  HomeViewModel.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel {

    var repos: [Repository] = []
    var canLoadMore: Bool = false

    func loadAPI(completion: @escaping Completion) {
        APIManager.Repository().search() { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success(let data):
                guard let data = data else { return }
                this.repos.append(contentsOf: data.repos)
                this.canLoadMore = data.totalCount > this.repos.count
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getHomeCellModel(atIndexPath indexPath: IndexPath) -> HomeCellTableViewModel? {
        return HomeCellTableViewModel(repo: repos[indexPath.row])
    }

    func downloadImage(indexPath: IndexPath, completion: @escaping (UIImage?) -> Void) {
        let item = repos[indexPath.row]
        if item.avatarImage != nil {
            completion(item.avatarImage)
        } else {
            API.shared().downloadImage(url: item.avatarUrl) { (image) in
                if let image = image {
                    item.avatarImage = image
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return repos.count
    }
}

