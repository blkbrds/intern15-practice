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
    
    func viewModelForCell(at indexPath: IndexPath) -> DetailCellViewModel? {
        guard let repo = repo else { return nil }
        return DetailCellViewModel(repo: repo)
    }

    func handleFavoriteRepo(completion: Completion) {
        guard let repo = repo else { return }
        do {
            let realm = try Realm()
            let objects = realm.objects(Repository.self).filter("id = %d", repo.id)
            if let object = objects.first {
                try realm.write {
                    object.isFavorite = !object.isFavorite
                    repo.isFavorite = object.isFavorite
                }
            }
            completion(.success(nil))

        } catch {
            completion(.failure(error))
        }
    }

    func loadFavoriteStatus(completion: Completion) {
        guard let repo = repo else { return }
        do {
            let realm = try Realm()
            let object = realm.objects(Repository.self).filter("id = %d", repo.id)
            if let object = object.first {
                try realm.write {
                    repo.isFavorite = object.isFavorite
                }
            }
            completion(.success(nil))
        } catch {
            completion(.failure(error))
        }
    }

    func setupObserer() {
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
                default :
                    break
                }
            })
        } catch {
            
        }
    }
}
