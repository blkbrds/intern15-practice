//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class DetailViewModel {

    var user: User
    var isLiked = false

    init(user: User = User()) {
        self.user = user
    }

//    func saveRealm(completion: Completion) {
//        Repository.saveRepository(repo: repo) { (result) in
//            switch result {
//            case .success:
//                completion(.success(nil))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
    func saveLikedUser(completion: Completion) {
        User.saveUser(user: user) { (result) in
            switch result {
            case .success:
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteLikedUser(completion: Completion) {
        User.delete(user: user) { (result) in
            switch result {
            case .success:
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func checkLikedUser(completion: Completion) {
        User.checkLikedUser(user: user) { (result) in
            switch result {
            case .success(let isLiked):
                self.isLiked = isLiked
                completion(.success(nil))
            case.failure(let error):
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

    func makeCommentViewModel(at indexPath: IndexPath) -> CommentViewModel {
        let item = user.comments[indexPath.row]
        return CommentViewModel(comment: item)
    }

    func makeMapViewModel(at indexPath: IndexPath) -> MapViewModel {
        return MapViewModel()
    }

    func makeDescription(at indexPath: IndexPath) -> DescriptionViewModel {
        return DescriptionViewModel(description: user.descriptionName)
    }

    func makeAlbumViewModel(at indexPath: IndexPath) -> AlbumImageViewModel {
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
