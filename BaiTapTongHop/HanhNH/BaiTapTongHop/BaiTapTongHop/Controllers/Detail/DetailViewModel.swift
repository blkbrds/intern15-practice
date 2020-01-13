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

    private let user: User
    
    init() {
        user = DummyData.userVinh
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
            return Config.heightForRowAt
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
        return AlbumImageViewModel(imageNames: user.coverImageNames)
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
        static let heightForRowAt: CGFloat = 160
        static let numberOfItems: Int = 1
    }
}
