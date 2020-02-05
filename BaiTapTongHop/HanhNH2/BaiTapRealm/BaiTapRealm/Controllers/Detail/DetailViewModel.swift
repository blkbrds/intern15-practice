//
//  DetailViewModel.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import RealmSwift

protocol DetailViewModelDelegate: class {
    func viewModel(_viewModel: DetailViewModel, needperfomAction action: DetailViewModel.Action)
}

final class DetailViewModel {

    enum Action {
        case reloadData
    }

    var repo: Repository?
    var notification: NotificationToken?
    weak var delegate: DetailViewModelDelegate?

    func viewModelForCell() -> DetailCellViewModel? {
        guard let repo = repo else { return nil }
        return DetailCellViewModel(repo: repo)
    }

    func handleFavoriteRepo(completion: Completion) {
        guard let repo = repo else { return }
        do {
            let realm = try Realm()
            try realm.write {
                repo.isFavorite = !repo.isFavorite
                repo.favoriteTime = Date()
                realm.create(Repository.self, value: repo, update: .modified)
            }
            completion(.success(nil))
        } catch {
            completion(.failure(error))
        }
    }

    func loadFavoriteStatus(completion: () -> (Void)) {
        guard let repo = repo else { return }
        do {
            let realm = try Realm()
            let object = realm.objects(Repository.self).filter("id = %d AND isFavorite == true", repo.id)
            if let object = object.first {
                try realm.write {
                    self.repo = object
                }
            } else {
                try realm.write {
                    self.repo?.isFavorite = false
                }
            }
        } catch { }
        completion()
    }

    func downloadImage(indexPath: IndexPath, completion: @escaping (UIImage?) -> Void) {
        guard let repo = repo else { return }
        if let data = repo.avatarImage {
            completion(UIImage(data: data))
        } else {
            API.shared().downloadImage(url: repo.avatarUrl) { (image) in
                if let image = image {
                    repo.avatarImage = image.pngData()
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
    }

    func setupObserver() {
        guard let repo = repo else { return }
        do {
            let realm = try Realm()
            let object = realm.objects(Repository.self).filter("id = %d", repo.id)
            notification = object.first?.observe({ [weak self] (change) in
                guard let this = self else { return }
                switch change {
                case .change(let properties):
                    for item in properties {
                        if item.name == "isFavorite", let newValue = item.newValue as? Bool {
                            this.repo?.isFavorite = newValue
                            this.delegate?.viewModel(_viewModel: this, needperfomAction: .reloadData)
                        }
                    }
                default:
                    break
                }
            })
        } catch { }
    }
    
    func numberOfRowsInSection() -> Int {
        return 1
    }
}
