//
//  FavoriteViewModel.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 2/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import RealmSwift

protocol FavoriteViewModelDelegate: class {
    func viewModel(_viewModel: FavoriteViewModel, needperfomAction action: FavoriteViewModel.Action)
}

final class FavoriteViewModel {

    enum Action {
        case reloadData
    }

    var repos: [Repository] = []
    var notification: NotificationToken?
    weak var delegate: FavoriteViewModelDelegate?

    func loadRepos(completion: Completion) {
        do {
            let realm = try Realm()
            let object = realm.objects(Repository.self).filter("isFavorite == true")
            repos = Array(object)
            completion(.success(nil))

        } catch {
            completion(.failure(error))
        }
    }

    func numberOfRowsInSection(in section: Int) -> Int {
        return repos.count
    }

    func viewModelForCell(at indexPath: IndexPath) -> FavoriteCellViewModel {
        return FavoriteCellViewModel(repo: repos[indexPath.row])
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

    func setupObserver() {
        let realm = try! Realm()
        notification = realm.objects(Repository.self).observe({ [weak self] (action) in
            guard let this = self else { return }
            switch action {
            case .update:
                this.delegate?.viewModel(_viewModel: this, needperfomAction: .reloadData)
            default:
                break
            }

        })
    }

    func unfavorite(at indexPath: IndexPath, completion: Completion) {
        do {
            let realm = try Realm()
            if let object = realm.object(ofType: Repository.self, forPrimaryKey: repos[indexPath.row].id) {
                try realm.write {
                    object.isFavorite = false
                }
            }
            completion(.success(nil))
        } catch {
            completion(.failure(error))
        }
    }

    func removeAllFavoriteRepo(completion: Completion) {
        do {
            let realm = try Realm()
            let object = realm.objects(Repository.self).filter("isFavorite == true")
            for item in object {
                try realm.write {
                    item.isFavorite = false
                }
            }
            completion(.success(nil))
        } catch {
            completion(.failure(error))
        }
    }
}
