//
//  HomeViewModel.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel {
    typealias Completion = (Bool, String) -> Void
    //poperties
    var repos: [Repo] = []
    var images: [ImageSlider] = []
    var isShowTableView: Bool = true
    var page: Int = 1
    var canLoadMore: Bool = true
    var canLoadMore2: Bool = false
    var totalCount = 0
    var isLoading = false
    
    func loadImagesSlide() {
        images = ImageSlider.getGetDummyDatas()
    }
    //actions
    func changeDisplay(completion: (Bool) -> ()) {
        //data
        isShowTableView = !isShowTableView
        //call back
        completion(true)
    }
    //lay IndexPath
    func getHomeCellModel(atIndexPath indexPath: IndexPath) -> HomeCellTabelViewModel? {
        return HomeCellTabelViewModel(repo: repos[indexPath.row])
    }
    //image slider
    func numberImageSlide() -> Int {
        return repos.count
    }

    func numberSectionSlide() -> Int {
        return 1
    }

    func imageSlide(in index: Int) -> ImageSlider {
        return images[index]
    }
    func loadAPI(completion: @escaping Completion) {
        self.page = 1
        APIManager.Repo.getRepo(page: page) { (result) in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let data):

                self.repos = data.repos
                self.canLoadMore2 = data.total_count > self.repos.count
                completion(true, "")
            }

        }
    }

    func loadMore(completion: @escaping Completion) {
        if isLoading {
            return
        }
        isLoading = true
        if canLoadMore2 {
            page += 1
        }
        APIManager.Repo.getRepo(page: page) { (result) in
            self.isLoading = false
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let data):
                self.repos.append(contentsOf: data.repos)
                self.canLoadMore2 = data.total_count > self.repos.count
                completion(true, "")
            }
        }
    }

    func downlodaImage(indexPath: IndexPath, completion: @escaping (UIImage?) -> Void) {
        let item = repos[indexPath.row]
        if item.avatar != nil {
            completion(item.avatar)
        } else {
            Networking.shared().downloadImage(url: item.avatarUrl) { (image) in
                if let images = image {
                    item.avatar = images
                    completion(images)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
