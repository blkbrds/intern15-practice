//
//  HomeViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel {
    typealias Completion = (Bool, String) -> Void
    var repos: [Repo] = []
    var images: [ImageSlider] = []
    var isShowTableView: Bool = true
    var page: Int = 1
    var canLoadMore: Bool = false
    var totalCount = 0
    var isLoading = false

    func loadImagesSlide() {
        images = ImageSlider.getDummyDatas()
    }
    func changeDisplay(completion: (Bool) -> ()) {
        isShowTableView = !isShowTableView
        completion(true)
    }
    
    func getHomeCellModel(atIndexPath indexPath: IndexPath) -> HomeCellTableViewModel? {
        return HomeCellTableViewModel(repo: repos[indexPath.row])
    }

    func numberImageSlide() -> Int {
        return repos.count
    }

    func numberSectionSlide() -> Int {
        return 1
    }
    
    func numberOfSections() -> Int {
        return 2
    }

    func imageSlide(in index: Int) -> ImageSlider {
        return images[index]
    }
    
    func loadAPI(completion: @escaping Completion) {
        self.page = 1
        APIManager.Repo.getRepo(page: page) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success(let data):
                this.repos = data.repos
                this.canLoadMore = data.total_count > this.repos.count
                completion(true, "")
            case .failure(let error):
                completion(false, error.localizedDescription)
            }

        }
    }
    
    func loadMore(completion: @escaping Completion) {
        if isLoading {
            return
        }
        isLoading = true
        if canLoadMore {
            page += 1
        }
        APIManager.Repo.getRepo(page: page) { [weak self] (result) in
            guard let this = self else { return }
            this.isLoading = false
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let data):
                this.repos.append(contentsOf: data.repos)
                this.canLoadMore = data.total_count > this.repos.count
                completion(true, "")
            }
        }
    }

    func downloadImage(indexPath: IndexPath, completion: @escaping (UIImage?) -> Void) {
        let item = repos[indexPath.row]
        if item.avatarImage != nil {
            completion(item.avatarImage)
        } else {
            Networking.shared().downloadImage(url: item.avatarUrl) { (image) in
                if let image = image {
                    item.avatarImage = image
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
