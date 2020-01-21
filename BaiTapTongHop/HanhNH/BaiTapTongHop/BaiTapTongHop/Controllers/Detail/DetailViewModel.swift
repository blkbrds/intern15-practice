//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol DetailViewModelDelegate {
     func viewModel(_viewModel: DetailViewModel, needperfomAction action: DetailViewModel.Action)
}

final class DetailViewModel {

    var user: User?
    var isLiked = false
    var notification: NotificationToken?
    var delegate: DetailViewModelDelegate?
    
    enum Action {
        case reloadData
    }
    
    func isFavoriteUser(completion: () -> Void) {
        guard let user = user else { return }
        RealmManager.shared.isFavoriteUser(id: user.id) { (reslut) in
            switch reslut {
            case .success(let isLiked):
                self.isLiked = isLiked
                completion()
            case .failure:
                completion()
            }
        }
    }
    
    
    func saveLikedUser(completion: Completion) {
        guard let user = user else { return }
        RealmManager.shared.saveUser(user: user) { (result) in
            switch result {
            case .success:
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func setupObserve() {
        let realm = try! Realm()
        notification = realm.objects(User.self).observe({ (action) in
            self.delegate?.viewModel(_viewModel: self, needperfomAction: .reloadData)
        })
    }

    func deleteLikedUser(completion: Completion) {
        guard let user = user else { return }
        RealmManager.shared.delete(user: user) { (result) in
            switch result {
            case .success:
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
extension DetailViewModel {

    func numberOfSections() -> Int {
        return SectionType.allCases.count
    }

    func numberOfItems(section: Int) -> Int {
        guard let user = user else { return 0 }
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .albums, .description, .map:
            return Config.numberOfItems
        case .comments:
            return user.comments.count
        }
    }

    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return .zero }
        switch sectionType {
        case .albums, .map:
            return Config.heightForRow
        case .comments, .description:
            return UITableView.automaticDimension
        }
    }

    func makeCommentViewModel(at indexPath: IndexPath) -> CommentViewModel? {
        guard let user = user else { return nil }
        let item = user.comments[indexPath.row]
        return CommentViewModel(comment: item)
    }

    func makeMapViewModel(at indexPath: IndexPath) -> MapViewModel {
        return MapViewModel()
    }

    func makeDescription(at indexPath: IndexPath) -> DescriptionViewModel? {
        guard let user = user else { return nil }
        return DescriptionViewModel(description: user.descriptionName)
    }

    func makeAlbumViewModel(at indexPath: IndexPath) -> AlbumImageViewModel? {
        guard let user = user else { return nil }
        return AlbumImageViewModel(imageNames: Array(user.coverImageNames))
    }
}

extension DetailViewModel {

    enum SectionType: Int, CaseIterable {
        case albums
        case description
        case map
        case comments
    }

    struct Config {
        static let heightForRow: CGFloat = 160
        static let numberOfItems: Int = 1
    }
}
