//
//  HomeViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

final class HomeViewModel {


    var repos: [Repository] = []
    var imageNames: [String] = []
    var isShowTableView: Bool = true
    var page: Int = 1
    var canLoadMore: Bool = false
    var totalCount = 0
    var isLoading = false

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

    func imageNameForSlide(in index: Int) -> String {
        return imageNames[index]
    }

    func loadAPI(completion: @escaping Completion) {
        let params: [String: String] = ["q": "topic:swift",
            "page": String(page),
            "per_page": "10"]
        APIManager.Repository().search(params: params) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success(let data):
                if this.page == 1 {
                    this.repos = data.repos
                } else {
                    this.repos.append(contentsOf: data.repos)
                }
                this.canLoadMore = data.total_count > this.repos.count
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }

        }
    }

    func downloadImage(indexPath: IndexPath, completion: @escaping (UIImage?) -> Void) {
        let item = repos[indexPath.row]
        if let data = item.avatarImage {
            completion(UIImage(data: data))
        } else {
            Networking.shared().downloadImage(url: item.avatarUrl) { (image) in
                if let image = image {
                    item.avatarImage = image.pngData()
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
    }

    func loadAPI(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()

            try! realm.write {
                realm.add(repos.self)
            }

            completion(true)

        } catch {
            completion(false)
        }
    }
}
