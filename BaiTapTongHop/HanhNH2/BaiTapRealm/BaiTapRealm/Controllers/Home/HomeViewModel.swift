//
//  HomeViewModel.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

final class HomeViewModel {
    
    var repos: [Repository] = []
    var canLoadMore: Bool = false

    func loadAPI(completion: @escaping Completion) {
        APIManager.Repository().search() { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success(let data):
                guard let data = data else { return }
                this.repos = data.repos
                this.canLoadMore = data.totalCount > this.repos.count
                this.saveAll(completion: completion)
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
            if let data = item.avatarImage {
            completion(UIImage(data: data))
        } else {
            API.shared().downloadImage(url: item.avatarUrl) { (image) in
                if let image = image {
                    item.avatarImage = image.pngData()
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
    
    func saveAll(completion: @escaping Completion) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(repos)
            }
            completion(.success(nil))
        } catch {
            completion(.failure(error))
        }
    }
    
    func reset(comletion: @escaping Completion) {
        do {
            let realm = try Realm()
            let object = realm.objects(Repository.self)
            try realm.write {
                realm.delete(object)
                loadAPI(completion: comletion)
            }
        } catch {
            comletion(.failure(error))
        }
    }
    
    func deleteAll(completion: @escaping Completion) {
        do {
            let realm = try Realm()
            let object = realm.objects(Repository.self)
            try realm.write {
                realm.delete(object)
                completion(.success(nil))
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    func getRepo(at indexPath: IndexPath) -> DetailViewModel {
        let viewModel = DetailViewModel()
        viewModel.repo = repos[indexPath.row]
        return viewModel
    }
}
