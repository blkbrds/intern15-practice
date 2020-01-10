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

    let user: User
    
    init() {
        user = DummyData.userVinh
    }
}

extension DetailViewModel {

    func numberOfSections() -> Int {
        return SectionType.allCases.count
    }

    func numberOfItems(section: Int) -> Int {
        guard let section = SectionType(rawValue: section) else { return 0 }
        switch section {
        case .albums, .description, .map:
            return Config.numberOfItems
        case .comments:
            return user.comments.count
        }
    }

    func heightForRowAt(at indexPath: IndexPath) -> CGFloat {
        guard let section = SectionType(rawValue: indexPath.section) else { return .zero }
        switch section {
        case .albums, .map:
            return CGFloat(Config.heightForRowAt)
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
        return DescriptionViewModel(description: user.description)
    }

    func makeAlbumViewModel(at indexPath: IndexPath) -> AlbumImageViewModel {
        return AlbumImageViewModel(images: user.coverImageNames)
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
        static let heightForRowAt: Float = 160
        static let numberOfItems: Int = 1
    }
}


